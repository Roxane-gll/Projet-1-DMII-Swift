//
//  BLEClient.swift
//  SwiftUI_BLE
//
//  Created by Al on 03/11/2023.
//

import Foundation

import CoreBluetooth

class BLEManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    static let instance = BLEManager()
    
    var centralManager: CBCentralManager!
    var discoveredPeripheral: CBPeripheral?
    var identifier:Int = -1
    let serviceUUID = CBUUID(string: "7777")
    let characteristicUUID = CBUUID(string: "DDDD")
    var writableCharacteristic: CBCharacteristic?
    
    var scanCallback: ((CBPeripheral,String) -> ())?
    var connectCallback: ((CBPeripheral) -> ())?
    var disconnectCallback: ((CBPeripheral) -> ())?
    var didFinishDiscoveryCallback: ((CBPeripheral) -> ())?
    var messageReceivedCallback:((Data?)->())?
    var isScanning = false
    var bleReadyCallback: (() -> ())?
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func matchesPattern(_ string: String) -> Bool {
        let regex = #"^\d+_\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$"#
        return string.range(of: regex, options: .regularExpression) != nil
    }

    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("BLE ON")
            bleReadyCallback?()
        default:
            print("Bluetooth is not available.")
        }
    }
    
    func waitForBLE(callback:@escaping ()->()) {
        bleReadyCallback = callback
    }
    
    func scan(forIdentifier:Int, callback: @escaping (CBPeripheral,String) -> ()) {
        self.identifier = forIdentifier
        isScanning = true
        scanCallback = callback
        centralManager.scanForPeripherals(withServices: [], options: nil)
    }
    
    func stopScan() {
        isScanning = false
        centralManager?.stopScan()
    }
    
    func sendData(data: Data?) {
        guard let peripheral = discoveredPeripheral, let characteristic = writableCharacteristic else {
            print("Peripheral or writableCharacteristic not found.")
            return
        }
        
        guard let dataToSend = data else {
            print("Data is nil.")
            return
        }
        
        // Determine how to write based on the characteristic's properties
        let type: CBCharacteristicWriteType = characteristic.properties.contains(.write) ? .withResponse : .withoutResponse
        
        peripheral.writeValue(dataToSend, for: characteristic, type: type)

    }
    
    func listenForMessages(callback:@escaping(Data?)->()) {
        messageReceivedCallback = callback
    }
    
    func disconnectPeripheral(_ periph: CBPeripheral, callback: @escaping (CBPeripheral) -> ()) {
        disconnectCallback = callback
        centralManager?.cancelPeripheralConnection(periph)
    }
    
    func connectPeripheral(_ periph: CBPeripheral, callback: @escaping (CBPeripheral) -> ()) {
        connectCallback = callback
        discoveredPeripheral = periph
        centralManager?.connect(periph, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Discovered \(String(describing: peripheral.name))")
        if let name = peripheral.name {
            if matchesPattern(name){
                let components = name.components(separatedBy: "_")
                if components[0] == "\(identifier)"{
                    discoveredPeripheral = peripheral
                    scanCallback?(peripheral,components[1])
                }
            }
        }
        
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to \(peripheral.name ?? "")")
        
        peripheral.delegate = self
        
        // Discover services for the connected peripheral
        peripheral.discoverServices([serviceUUID])
       
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        
        for service in services where service.uuid == serviceUUID {
            // Discover the characteristics for our service
            peripheral.discoverCharacteristics([characteristicUUID], for: service)
        }
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        
        for characteristic in characteristics where characteristic.uuid == characteristicUUID {
            if characteristic.properties.contains(.read) {
                peripheral.readValue(for: characteristic)
            }
            
            if characteristic.properties.contains(.write) || characteristic.properties.contains(.writeWithoutResponse) {
                writableCharacteristic = characteristic
            }

            if characteristic.properties.contains(.notify) {
                peripheral.setNotifyValue(true, for: characteristic)
            }
        }
        
        connectCallback?(peripheral)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if characteristic.uuid == characteristicUUID, let value = characteristic.value {
            let stringValue = String(data: value, encoding: .utf8)
            messageReceivedCallback?(value)
            print("Received value: \(stringValue ?? "")")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if characteristic.uuid == characteristicUUID, let value = characteristic.value {
            let stringValue = String(data: value, encoding: .utf8)
            messageReceivedCallback?(value)
            print("Received value: \(stringValue ?? "")")
        }
    }
    
    
    
    func cleanup() {
        guard let discoveredPeripheral = discoveredPeripheral else { return }
        
        if discoveredPeripheral.state != .connected {
            return
        }
        
        if let services = discoveredPeripheral.services {
            for service in services {
                if let characteristics = service.characteristics {
                    for characteristic in characteristics {
                        if characteristic.uuid == characteristicUUID && characteristic.isNotifying {
                            discoveredPeripheral.setNotifyValue(false, for: characteristic)
                            return
                        }
                    }
                }
            }
        }
        
        centralManager.cancelPeripheralConnection(discoveredPeripheral)
    }
}

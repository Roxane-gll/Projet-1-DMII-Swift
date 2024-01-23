//
//  SharedToyBox.swift
//  SpheroManager
//
//  Created by AL on 01/09/2019.
//  Copyright © 2019 AL. All rights reserved.
//

import Foundation

class SharedToyBox {
    
    static let instance = SharedToyBox()
    
    private var searchCallBack:((Error?)->())?
    
    let box = ToyBox()
    var boltsNames = [String]()
    var bolts:[BoltToy] = []
    var changes = false
    
    var bolt:BoltToy? {
        get {
            return bolts.first
        }
    }
    
    init() {
        box.addListener(self)
    }
    
    func searchForBoltsNamed(_ names:[String], doneCallBack:@escaping (Error?)->()) {
        searchCallBack = doneCallBack
        boltsNames = names
        box.start()
    }
    
    func stopScan() {
        box.stopScan()
    }
    
}

extension SharedToyBox:ToyBoxListener{
    func toyBoxReady(_ toyBox: ToyBox) {
        box.startScan()
    }
    
    func toyBox(_ toyBox: ToyBox, discovered descriptor: ToyDescriptor) {
        print("discovered \(descriptor.name)")
        
        if bolts.count >= boltsNames.count {
            box.stopScan()
        }else{
            if boltsNames.contains(descriptor.name ?? "") {
                let bolt = BoltToy(peripheral: descriptor.peripheral, owner: toyBox)
                bolts.append(bolt)
                toyBox.connect(toy: bolt)
            }
        }
        
    }
    
    func toyBox(_ toyBox: ToyBox, readied toy: Toy) {
        if let b = toy as? BoltToy {
            print(b.peripheral?.name ?? "")
            if let i = self.bolts.firstIndex(where: { (item) -> Bool in
                item.identifier == b.identifier
            }){
                self.bolts[i] = b
            }
            
            if bolts.count >= boltsNames.count {
                DispatchQueue.main.async {
                    self.searchCallBack?(nil)
                }
            }
            b.setMainLed(color: .clear)
            b.setBackLed(color: .clear)
            b.setFrontLed(color: .clear)
        }
    }
    
    func toyBox(_ toyBox: ToyBox, putAway toy: Toy) {
        print("put away")
        if let b = toy as? BoltToy {
            if let name = b.peripheral!.name {
                self.searchForBoltsNamed([name]) {err in
                    print("try")
                    if (err != nil) {
                        self.changes = true
                    }
                }
            }
        }

    }
    
    
}


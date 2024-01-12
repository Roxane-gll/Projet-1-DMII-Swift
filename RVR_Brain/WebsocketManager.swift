//
//  WebsocketManager.swift
//  SwiftUI_WS
//
//  Created by Al on 09/11/2023.
//

import Foundation
import NWWebSocket
import Network
import UIKit

class WebsocketManager {
    
    var socket:NWWebSocket?
    var lastPongDate: Date?
    var pongTimer:Timer?

    var connectionCallback:(()->())?
    var disconnectionCallback:(()->())?
    var receivedDataCallback:((String)->())?
    var receivedImageCallback:((UIImage)->())?
    
    init(){
       
    }
    
    func setupFor(urlString:String){
        if let socketURL = URL(string: urlString){
            socket = NWWebSocket(url: socketURL)
            socket?.delegate = self
        }
    }
    
    func connect(callback:@escaping ()->()){
        self.connectionCallback = callback
        socket?.connect()
    }
    
    func disconnect(callback:@escaping ()->()){
        self.disconnectionCallback = callback
        socket?.disconnect()
    }
    
    func listenForMessage(callback:@escaping (String)->()) {
        self.receivedDataCallback = callback
    }
    
    func listenForImage(callback:@escaping (UIImage)->()) {
        self.receivedImageCallback = callback
    }
    
    func sendData(string:String){
        socket?.send(string: string)
    }
    
    func sendData(data:Data){
        socket?.send(data: data)
    }
    
}

extension WebsocketManager: WebSocketConnectionDelegate {
    
    func webSocketDidConnect(connection: WebSocketConnection) {
        // Respond to a WebSocket connection event
        self.connectionCallback?()
        socket?.ping(interval: 0.5)
    }

    func webSocketDidDisconnect(connection: WebSocketConnection,
                                closeCode: NWProtocolWebSocket.CloseCode, reason: Data?) {
        // Respond to a WebSocket disconnection event
        self.disconnectionCallback?()
    }

    func webSocketViabilityDidChange(connection: WebSocketConnection, isViable: Bool) {
        // Respond to a WebSocket connection viability change event
    }

    func webSocketDidAttemptBetterPathMigration(result: Result<WebSocketConnection, NWError>) {
        // Respond to when a WebSocket connection migrates to a better network path
        // (e.g. A device moves from a cellular connection to a Wi-Fi connection)
    }

    func webSocketDidReceiveError(connection: WebSocketConnection, error: NWError) {
        // Respond to a WebSocket error event
    }

    func webSocketDidReceivePong(connection: WebSocketConnection) {
        pongTimer?.invalidate()
        pongTimer = nil
        pongTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { t in
            self.disconnectionCallback?()
        })
    }

    func webSocketDidReceiveMessage(connection: WebSocketConnection, string: String) {
        // Respond to a WebSocket connection receiving a `String` message
        self.receivedDataCallback?(string)
    }

    func webSocketDidReceiveMessage(connection: WebSocketConnection, data: Data) {
        // Respond to a WebSocket connection receiving a binary `Data` message
        if let image = UIImage(data: data){
            self.receivedImageCallback?(image)
        }
    }
}

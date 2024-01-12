//
//  WebsocketObservable.swift
//  SwiftUI_WS
//
//  Created by Al on 09/11/2023.
//

import Foundation
import UIKit


class WebsocketObservable:ObservableObject {
    
    var websocketManager:WebsocketManager
    
    @Published var isConnected = false
    @Published var protection = true
    @Published var messages = [WebSocketMessage]()
    
    init(urlString:String){
        websocketManager = WebsocketManager()
        
    }
    
    func setupFor(urlString:String){
        websocketManager.disconnectionCallback = {
            self.isConnected = false
            self.protection = true
        }
        websocketManager.setupFor(urlString: urlString)
    }
    
    func connect() {
        websocketManager.connect {
            self.isConnected = true
            self.protection = false
            var jsonC = WebSocketMessage(name: "connection", value: "sphero").toJsonString()
            if (jsonC != nil) {
                self.sendString(string: jsonC!)
            }
        }
        self.listenForMessage()
    }
    
    func disconnect() {
        websocketManager.disconnect {
            self.isConnected = false
            self.protection = true
        }
    }
    
    func sendString(string:String){
        websocketManager.sendData(string: string)
    }
    
    func listenForMessage(){
        websocketManager.listenForMessage { str in
            var message = WebSocketMessage.fromJson(jsonString: str)
            if (message != nil) {
                self.messages.append(message!)
            }
        }
    }
    
    func jsonToString(json: AnyObject){
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            print(convertedString ?? "defaultvalue")
        } catch let myJSONError {
            print(myJSONError)
        }
        
    }
}

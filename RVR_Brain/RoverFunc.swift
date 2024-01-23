//
//  RoverFunc.swift
//  RVR_Brain
//
//  Created by digital on 12/01/2024.
//

import Foundation

class RoverFunc {
    func stopAndGetPosition(ws: WebsocketObservable) {
        var roverM = RoverMessage(action: "stop").toJsonString()
        if (roverM != nil) {
            ws.sendString(string: roverM!)
        }
        var roverP = RoverMessage(action: "getPosition").toJsonString()
        if (roverP != nil) {
            ws.sendString(string: roverP!)
        }
    }
    
    func roverTurn(ws:WebsocketObservable) {
        var roverTurn = RoverMessage(action: "uturn").toJsonString()
        if (roverTurn != nil) {
            ws.sendString(string: roverTurn!)
        }
    }
    
    func roverStart(ws:WebsocketObservable) {
        var roverM = RoverMessage(action: "go").toJsonString()
        if (roverM != nil) {
            ws.sendString(string: roverM!)
        }
    }
    
    func roverHome(ws:WebsocketObservable) {
        var roverM = RoverMessage(action: "home").toJsonString()
        if (roverM != nil) {
            ws.sendString(string: roverM!)
        }
    }
}

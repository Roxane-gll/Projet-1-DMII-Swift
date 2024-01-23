//
//  WebSocketConnect.swift
//  RVR_Brain
//
//  Created by RG on 23/01/2024.
//

import Foundation

class WebSocketConnect {
    func webSocketConnect(ws:WebsocketObservable, url:String, rover:Bool) {
        var retryConnection = true
        var urlStr = url
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: retryConnection) { t in
            if ws.isConnected {
                retryConnection = false
            } else {
                print("try connected Ws")
                ws.websocketManager.setupFor(urlString: urlStr)
                ws.connect()
            }
        }
        timer.fire()
    }
}

//
//  RVR_BrainApp.swift
//  RVR_Brain
//
//  Created by Al on 24/08/2023.
//

import SwiftUI

@main
struct RVR_BrainApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(webSocketClient: WebsocketObservable(urlString:"ws://127.0.0.1:8080"))
        }
    }
}

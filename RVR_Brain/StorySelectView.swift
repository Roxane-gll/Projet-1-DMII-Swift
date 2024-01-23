//
//  StorySelectView.swift
//  RVR_Brain
//
//  Created by RG on 21/01/2024.
//

import SwiftUI

struct StorySelectView: View {
    @ObservedObject var spheroObject = SpheroObservable()
    @ObservedObject var webSocketClient = WebsocketObservable(urlString: "")
    @ObservedObject var wsRoverCient = WebsocketObservable(urlString: "")
    @State var storySelected:Story?
    
    var body: some View {
        if ((self.storySelected == nil)) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button("Histoire 1 ") {
                        self.storySelected = story1
                        self.spheroObject.currentStory = story1
                        self.spheroObject.randomChapter()
                        var storyM = WebSocketMessage(name: "startStory", value: "true").toJsonString()
                        if (storyM != nil) {
                            self.webSocketClient.sendString(string:storyM!)
                        }
                    }
                    Spacer()
                }
                Text("Sphero narrator: \((self.spheroObject.narratoSphero != nil) ? "connected" : "not")")
                Text("Sphero Turn: \((self.spheroObject.turnSphero != nil) ? "connected" : "not")")
                Text("Sphero Tap: \((self.spheroObject.tapSphero != nil) ? "connected" : "not")")
                Text("WS Rover: \(self.wsRoverCient.isConnected ? "connected" : "not")")
                Text("WS server: \(self.webSocketClient.isConnected ? "connected" : "not")")
                Spacer()
            }.background(Color.gray.opacity(0.75))
        }
    }
}

//
//  ContentView.swift
//  RVR_Brain
//
//  Created by Al on 24/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var webSocketClient: WebsocketObservable
    
    @ObservedObject var wsRoverCient = WebsocketObservable(urlString: "ws://192.168.43.205:8080")
    var roverFunc = RoverFunc()
    var webSocketConnect = WebSocketConnect()
    
    let spheroRPIIdentifier = 4
    
    @ObservedObject var spheroObject = SpheroObservable()
    
    @State var storySelected:Story?
    
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    TopBar(chapterInt: self.spheroObject.currentChapter + 1, chapterObj: self.spheroObject.chapterC)
                    ZStack {
                        ScrollViewReader { storyScroll in
                            ChapterScroll(textChapter: self.spheroObject.chapterC.textL)
                        }.id("storyScroll").blur(radius: self.spheroObject.storyStarted ? 0 : 5)
                        if (!self.spheroObject.storyStarted) {
                            VStack {
                                if (self.spheroObject.isActive) {
                                    Text("Interactions \(self.spheroObject.typeInteraction == "visual" ? "visuels" : "sonores") en cours")
                                }
                                Button(!self.spheroObject.isActive ? "Commencer la lecture" : "Reprendre la lecture") {
                                    if (self.spheroObject.isActive) {
                                        self.spheroObject.stopInteraction()
                                    } else {
                                        self.spheroObject.startStory()
                                        var storyM = WebSocketMessage(name: "story", value: "\(self.spheroObject.chapterC.id)").toJsonString()
                                        if (storyM != nil) {
                                            self.webSocketClient.sendString(string:storyM!)
                                        }
                                    }
                                    self.roverFunc.roverStart(ws: self.wsRoverCient)
                                    var ledColor = WebSocketMessage(name: "leds", value: "[(76, 207, 215)]").toJsonString()
                                    if (ledColor != nil) {
                                        self.webSocketClient.sendString(string:ledColor!)
                                    }
                                }.padding().background(Color(red: 0.78, green: 0.85, blue: 0.3)).cornerRadius(8).foregroundColor(.white)
                            }
                        }
                    }
                }
                VStack {
                    VStack {
                        HStack {
                            Text("SOMMAIRE").font(.custom("Satoshi-Regular", size: 24)).padding(.top, 20).padding(.trailing, 10).foregroundColor(.black)
                            Spacer()
                        }.padding()
                        ForEach(0..<self.spheroObject.currentStory.chapters.count, id:\.self) { chapter in
                            SommaireChapter(currentChapter: self.spheroObject.currentChapter, chapterObj: spheroObject.currentStory.chapters[chapter], chapter: chapter)
                        }
                    }.padding()
                    Spacer()
                    if (!self.spheroObject.isActive) {
                        VStack {
                            HStack {
                                Button(action: {
                                    print("audio")
                                    self.roverFunc.roverTurn(ws: self.wsRoverCient)
                                    self.roverFunc.stopAndGetPosition(ws: self.wsRoverCient)
                                    self.spheroObject.startInteraction(type: "audio", ws:self.webSocketClient)
                                    var storyM = WebSocketMessage(name: "interact", value: "audio").toJsonString()
                                    if (storyM != nil) {
                                        self.webSocketClient.sendString(string:storyM!)
                                    }
                                    var ledColor = WebSocketMessage(name: "leds", value: "\(self.spheroObject.chapterC.interactionColor)").toJsonString()
                                    if (ledColor != nil) {
                                        self.webSocketClient.sendString(string:ledColor!)
                                    }
                                }) {
                                    VStack{
                                        Image("audio").padding()
                                    }.frame(width: 135, height:67).background(Color(red: 0.78, green: 0.85, blue: 0.3, opacity: 0.25)).cornerRadius(8).overlay(
                                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.78, green: 0.85, blue: 0.3))
                                    )
                                }
                                Button(action: {
                                    self.spheroObject.startInteraction(type: "visual", ws:self.webSocketClient)
                                    self.roverFunc.stopAndGetPosition(ws: self.wsRoverCient)
                                    var storyM = WebSocketMessage(name: "interact", value: "visual").toJsonString()
                                    if (storyM != nil) {
                                        self.webSocketClient.sendString(string:storyM!)
                                    }
                                }) {
                                    VStack{
                                        Image("visual").padding()
                                    }.frame(width: 135, height:67).background(Color(red: 0.78, green: 0.85, blue: 0.3, opacity: 0.25)).cornerRadius(8).overlay(
                                        RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.78, green: 0.85, blue: 0.3))
                                    )
                                }
                            }.frame(width: 307)
                            Button(action: {
                                self.spheroObject.nextChapter()
                                self.roverFunc.roverHome(ws: wsRoverCient)
                                var storyM = WebSocketMessage(name: "chapter", value: "\(self.spheroObject.chapterC.id)").toJsonString()
                                if (storyM != nil) {
                                    self.webSocketClient.sendString(string:storyM!)
                                }
                                var ledColor = WebSocketMessage(name: "leds", value: "[(76, 207, 215)]").toJsonString()
                                if (ledColor != nil) {
                                    self.webSocketClient.sendString(string:ledColor!)
                                }
                            }) {
                                Text("Chapitre suivant").padding(5)
                                Spacer()
                                Image("arrow").padding(5)
                            }.padding().background(Color(red: 0.78, green: 0.85, blue: 0.3)).cornerRadius(8).foregroundColor(.white)
                        }.frame(width:275).padding(.bottom, 35)
                    }
                }.background(Color(red: 0.96, green: 0.96, blue: 0.96))
            }.background(Color.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).font(.custom("Satoshi-Regular", size: 18))
            StorySelectView(spheroObject: self.spheroObject, webSocketClient: self.webSocketClient, wsRoverCient: self.wsRoverCient, storySelected: self.storySelected)
        }.onAppear {
            SharedToyBox.instance.searchForBoltsNamed(["SB-5D1C","SB-313C","SB-0994"]) { err in
                if err == nil {
                    SharedToyBox.instance.changes = true
                }
            }
            self.webSocketConnect.webSocketConnect(ws: self.webSocketClient, url: "ws://192.168.43.120:3001", rover: false)
                
            var rvrRetryCo = true
            let timerRover = Timer.scheduledTimer(withTimeInterval: 1, repeats: rvrRetryCo) { t in
                if self.wsRoverCient.isConnected {
                    rvrRetryCo = false
                } else {
                    print("try connected Rover")
                    wsRoverCient.rover = true
                    wsRoverCient.websocketManager.setupFor(urlString: "ws://192.168.43.205:8081")
                    wsRoverCient.connect()
                }
            }
            timerRover.fire()
            }.onChange(of: self.wsRoverCient.roverMessages, perform: { value in
                if let last = value.last {
                    print(last.position)
                    var storyM = WebSocketMessage(name: "rover", value: "\(last.position)").toJsonString()
                    if (storyM != nil) {
                        self.webSocketClient.sendString(string:storyM!)
                    }
                }
            }).onChange(of: self.spheroObject.isActive) { value in
                if (!value) {
                    var storyM = WebSocketMessage(name: "interact", value: "false").toJsonString()
                    if (storyM != nil) {
                        self.webSocketClient.sendString(string:storyM!)
                    }
                }
            }.onChange(of: self.webSocketClient.messages, perform: { value in
                self.spheroObject.webSocketMessage(messages: value, ws: self.webSocketClient, wsRover: self.wsRoverCient, roverfunc: self.roverFunc)
            }).onChange(of: self.spheroObject.button1) { value in
                if (value == 8) {
                    self.spheroObject.finishInteract(interaction: "button1")
                    var message = WebSocketMessage(name: "interact", value: "false", idInput: "button1").toJsonString()
                    if (message != nil) {
                        self.webSocketClient.sendString(string: message!)
                    }
                }
            }.onChange(of: self.spheroObject.button2) { value in
                if (value == 8) {
                    self.spheroObject.finishInteract(interaction: "button2")
                    var message = WebSocketMessage(name: "interact", value: "false", idInput: "button2").toJsonString()
                    if (message != nil) {
                        self.webSocketClient.sendString(string: message!)
                    }
                }
            }.onChange(of: self.spheroObject.rotocoder) { value in
                if (value == 8) {
                    self.spheroObject.finishInteract(interaction: "rotocoder")
                    var message = WebSocketMessage(name: "interact", value: "false", idInput: "rotocoder").toJsonString()
                    if (message != nil) {
                        self.webSocketClient.sendString(string: message!)
                    }
                }
            }.onChange(of: self.spheroObject.micro) { value in
                if (value == 8) {
                    self.spheroObject.finishInteract(interaction: "micro")
                    var message = WebSocketMessage(name: "interact", value: "false", idInput: "micro").toJsonString()
                    if (message != nil) {
                        self.webSocketClient.sendString(string: message!)
                    }
                }
            }.onChange(of: self.spheroObject.tapCount) { value in
                if (value > 0) {
                    var message = WebSocketMessage(name: "rpi", value: "true", idInput: "tapSphero").toJsonString()
                    if (message != nil) {
                        self.webSocketClient.sendString(string: message!)
                    }
                }
            }.onChange(of: self.spheroObject.turnCount) { value in
                if (value > 0) {
                    var message = WebSocketMessage(name: "rpi", value: "true", idInput: "turnSphero").toJsonString()
                    if (message != nil) {
                        self.webSocketClient.sendString(string: message!)
                    }
                }
            }.onChange(of: SharedToyBox.instance.changes) { value in
                print("vhfdihduishuvdiohvduisfhdsiuhu \(value)")
                if value {
                    for bolt in SharedToyBox.instance.bolts {
                        print(bolt.peripheral?.name)
                        if (bolt.peripheral?.name == "SB-5D1C") {
                            self.spheroObject.turnSphero = bolt
                            bolt.drawMatrix(pixel: Pixel(x: 0, y: 0), color: .red)
                        }
                        if (bolt.peripheral?.name == "SB-313C") {
                            self.spheroObject.narratoSphero = bolt
                        }
                        if (bolt.peripheral?.name == "SB-0994") {
                            self.spheroObject.tapSphero = bolt
                            bolt.drawMatrix(pixel: Pixel(x: 1, y: 1), color: .red)
                        }
                    }
//                    self.spheroObject.resumeSphero(ws:self.webSocketClient)
                    SharedToyBox.instance.changes = false
                }
            }
    }
}

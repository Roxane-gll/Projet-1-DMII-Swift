//
//  ContentView.swift
//  RVR_Brain
//
//  Created by Al on 24/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var webSocketClient: WebsocketObservable
    
    @ObservedObject var wsRoverCient = WebsocketObservable(urlString: "ws://192.168.43.82:8080")
    
    let spheroRPIIdentifier = 4
    
    @ObservedObject var spheroObject = SpheroObservable()
    
    var robotAlignement:RobotAlignment = RobotAlignment(imageWidth: 244, imageHeight: 244,tolerance: 0.3,inverted: false)
    
    @State var faceSize:String = ""
    
    let btnSide:CGFloat = 50.0
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    HStack{
                        Text("Chapitre \(self.spheroObject.currentChapter + 1) - ").padding(.leading, 30).font(.custom("Satoshi-Black", size: 24))
                        Text("\(self.spheroObject.chapterC.titleC)").font(.title2).font(.custom("Satoshi-Regular", size: 20))
                        Spacer()
                        Button("Commencer") {
                            self.spheroObject.startStory()
                            var storyM = WebSocketMessage(name: "story", value: "\(self.spheroObject.chapterC.id)").toJsonString()
                            if (storyM != nil) {
                                self.webSocketClient.sendString(string:storyM!)
                            }
                            self.wsRoverCient.sendString(string: "Go")
                        }.padding().background(Color(red: 0.78, green: 0.85, blue: 0.3)).cornerRadius(8).foregroundColor(.white)
                    }.padding([.trailing, .leading],20).frame(width: 775,height: 121).background(Color.white.opacity(0.75)).foregroundColor(.black)
                }.frame(width:735).background {
                    Image(self.spheroObject.chapterC.image).resizable().frame(width:775, height: 121).scaledToFill().clipped()
                }
                ScrollViewReader { storyScroll in
                    ScrollView {
                        VStack(alignment: .leading) {
                            TextChapterView(chapter: self.spheroObject.chapterC.textL).padding(.leading, 35)
                        }.frame(width: 725).padding([.top, .bottom])
                    }.onChange(of: self.spheroObject.currentChapter) { value in
                        storyScroll.scrollTo("storyScroll", anchor:.top)
                        }
                }.id("storyScroll")
            }
            VStack {
                VStack {
                    HStack {
                        Text("SOMMAIRE").font(.custom("Satoshi-Regular", size: 24)).padding(.top, 20).padding(.trailing, 10).foregroundColor(.black)
                        Spacer()
                    }.padding()
                    ForEach(0..<self.spheroObject.currentStory.chapters.count, id:\.self) { chapter in
                        HStack{
                            Text("Chapitre \(chapter + 1)").font(.custom("Satoshi-Black", size: 18))
                            Text("- \(self.spheroObject.currentStory.chapters[chapter].titleC)").font(.custom("Satoshi-Regular", size: 18))
                            Spacer()
                        }.foregroundColor(self.spheroObject.currentChapter == chapter ? Color(red: 0.56, green: 0.63, blue: 0.0) : Color.black).padding().frame(width:327).background(self.spheroObject.currentChapter == chapter ? Color(red: 0.78, green: 0.85, blue: 0.3, opacity: 0.25) : Color.clear)
                    }
                }.padding()
                Spacer()
                VStack {
                    Button("Stop"){
                        self.spheroObject.stopInteraction()
                    }
                    HStack {
                        Button(action: {
                            print("audio")
                            self.spheroObject.startInteraction(type: "audio")
                            var storyM = WebSocketMessage(name: "interact", value: "audio").toJsonString()
                            if (storyM != nil) {
                                self.webSocketClient.sendString(string:storyM!)
                            }
                        }) {
                            VStack{
                                Image("audio").padding()
                            }.frame(width: 135, height:67).background(Color(red: 0.78, green: 0.85, blue: 0.3, opacity: 0.25)).cornerRadius(8).overlay(
                                RoundedRectangle(cornerRadius: 8).stroke(Color(red: 0.78, green: 0.85, blue: 0.3))
                            )
                        }
                        Button(action: {
                            self.spheroObject.startInteraction(type: "visual")
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
                        var storyM = WebSocketMessage(name: "chapter", value: "next").toJsonString()
                        if (storyM != nil) {
                            self.webSocketClient.sendString(string:storyM!)
                        }
                    }) {
                        Text("Chapitre suivant").padding(5)
                        Spacer()
                        Image("arrow").padding(5)
                    }.padding().background(Color(red: 0.78, green: 0.85, blue: 0.3)).cornerRadius(8).foregroundColor(.white)
                }.frame(width:275).padding()
            }.background(Color(red: 0.96, green: 0.96, blue: 0.96))
        }.background(Color.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .onAppear {
                SharedToyBox.instance.searchForBoltsNamed(["SB-5D1C","SB-313C","SB-0994"]) { err in
                    if err == nil {
                        for bolt in SharedToyBox.instance.bolts {
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
                    }
                }
                var retryConnection = true
                var urlStr = "ws://192.168.43.120:3001"
                let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: retryConnection) { t in
                    if webSocketClient.isConnected {
                        retryConnection = false
                    } else {
                        print("try connected")
                        webSocketClient.websocketManager.setupFor(urlString: urlStr)
                        webSocketClient.connect()
                    }
                }
                timer.fire()
                
                var rvrRetryCo = true
                let timerRover = Timer.scheduledTimer(withTimeInterval: 1, repeats: rvrRetryCo) { t in
                    if self.wsRoverCient.isConnected {
                        rvrRetryCo = false
                    } else {
                        print("try connected")
                        wsRoverCient.websocketManager.setupFor(urlString: "192.168.43.80:8080")
                        wsRoverCient.connect()
                    }
                }
                timerRover.fire()
            }.onChange(of: self.spheroObject.isActive) { value in
                if (!value) {
                    var storyM = WebSocketMessage(name: "interact", value: "false").toJsonString()
                    if (storyM != nil) {
                        self.webSocketClient.sendString(string:storyM!)
                    }
                }
            }.onChange(of: self.webSocketClient.messages, perform: { value in
                if (value.last?.name == "rpi") {
                    var message = value.last!
                    if (message.idInput != nil) {
                        self.spheroObject.websocketInteraction(idInput: message.idInput!)
                    }
                }
            }).onChange(of: self.spheroObject.interactionStart) { value in
                var newMessage = WebSocketStartInteract(name: "interact")
                for interact in value {
                    newMessage.value[interact] = "true"
                }
                if (newMessage.value.count > 0) {
                    var message = newMessage.toJsonString()
                    if (message != nil) {
                        self.webSocketClient.sendString(string: message!)
                    }
                }
            }.onChange(of: self.spheroObject.button1) { value in
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
            }
    }
}

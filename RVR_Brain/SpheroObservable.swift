//
//  SpheroObservable.swift
//  RVR_Brain
//
//  Created by RG on 07/01/2024.
//

import Foundation
import SwiftUI

class SpheroObservable:ObservableObject {
    var soundPlayer:SoundPlayer = SoundPlayer()
    
    @Published var currentStory:Story = story1
    @Published var currentChapter:Int = 0
    @Published var chapterC:Chapter = story1.chapters[0]
    @Published var storyStarted:Bool = false

    @Published var turnSphero:BoltToy?
    @Published var tapSphero:BoltToy?
    @Published var narratoSphero:BoltToy?
    
    @Published var isActive = false
    
    @Published var tapCount = 0
    var maxTap = 8
    var tapColored = 0
    
    var turnRotation = 0.0
    @Published var turnCount = 0
    var maxTurn = 8
    var turnColored = 0
    
    var maxMatrix = 4
    var narratorColored = false
    var currentLine = 1
    var lastMatrix = 7
    var color:[UIColor] = [.green, .yellow, .orange, .red]
    var colored = 0
    
    @Published var button1 = 0
    @Published var button2 = 0
    @Published var rotocoder = 0
    @Published var micro = 0
    
    @Published var interactionStart = [String]()
    var multipleRemoveLine = 4
    var interactionFinished = [String]()
    @Published var typeInteraction = "visual"
    
    func startInteraction(type:String, ws:WebsocketObservable) {
        self.soundPlayer.volumeDown()
        self.storyStarted = false
        while (!self.narratorColored) {
            self.narratorRemoveLineColor()
        }
        for _ in 1...4 {
            self.narratoSphero?.rotateAim(60)
            self.narratoSphero?.rotateAim(-60)
        }
        self.isActive = true
        self.currentLine = 1
        self.lastMatrix = 7
        self.tapCount = 0
        self.turnCount = 0
        self.typeInteraction = type
        self.selectInteraction(type: type, ws:ws)
    }
    
    func selectInteraction(type:String, ws: WebsocketObservable) {
        let interacts = type == "audio" ? Array(self.chapterC.audioInteraction.keys) : self.chapterC.visualIntraction
        if (interacts.count <= 2) {
            self.multipleRemoveLine = 1
        } else {
            self.multipleRemoveLine = interacts.count <= 4 ? 2 : 4
        }
        for interact in interacts {
            self.interactionStart.append(interact)
            if (interact == "turnSphero") {
                self.turnSphero?.drawMatrix(fillFrom: Pixel(x:0, y:0), to: Pixel(x: 7, y: 7), color: .green)
                self.turnSpheroInteraction()
            }
            if (interact == "tapSphero") {
                self.tapSphero?.drawMatrix(fillFrom: Pixel(x:0, y:0), to: Pixel(x: 7, y: 7), color: .green)
                self.tapSpheroInteraction()
            }
        }
        self.sendInteractionWs(ws: ws, interactions: interacts)
    }
    
    func stopInteraction() {
        while (self.narratorColored) {
            self.narratorRemoveLineColor()
        }
        self.isActive = false
        self.tapSpheroInteraction()
        self.turnSpheroInteraction()
        self.tapSphero?.clearMatrix()
        self.turnSphero?.clearMatrix()
        self.tapColored = 0
        self.turnColored = 0
        self.currentLine = 1
        self.lastMatrix = 7
        self.button1 = 0
        self.button2 = 0
        self.rotocoder = 0
        self.interactionStart = []
        self.interactionFinished = []
        self.typeInteraction = ""
        self.storyStarted = true
        self.soundPlayer.volumeUp()
    }
    
    func narratorRemoveLineColor() {
        self.narratoSphero?.rotateAim(60)
        self.narratoSphero?.rotateAim(-60)
        let color:UIColor = self.isActive ? .clear : self.color[7-(self.lastMatrix > 3 ? self.lastMatrix : 4)]
        if (self.currentLine == 1) {
            self.narratoSphero?.drawMatrix(fillFrom: Pixel(x:7-self.lastMatrix, y:7-self.lastMatrix), to: Pixel(x: 7-self.lastMatrix, y: self.lastMatrix), color: color)
            self.currentLine = self.currentLine + 1
        } else if (self.currentLine == 2) {
            self.narratoSphero?.drawMatrix(fillFrom: Pixel(x:7-self.lastMatrix, y:self.lastMatrix), to: Pixel(x: self.lastMatrix, y: self.lastMatrix), color: color)
            self.currentLine = self.currentLine + 1
        } else if (self.currentLine == 3) {
            self.narratoSphero?.drawMatrix(fillFrom: Pixel(x:self.lastMatrix, y:self.lastMatrix), to: Pixel(x: self.lastMatrix, y: 7-self.lastMatrix), color: color)
            self.currentLine = self.currentLine + 1
        } else if (self.currentLine == 4) {
            self.narratoSphero?.drawMatrix(fillFrom: Pixel(x:self.lastMatrix, y:7-self.lastMatrix), to: Pixel(x: 7-self.lastMatrix, y: 7-self.lastMatrix), color: color)
            self.currentLine = 1
            self.lastMatrix = self.lastMatrix - 1
            if (self.lastMatrix <= 3) {
                self.narratorColored = !self.narratorColored
            }
        }
        self.colored = self.narratorColored ? self.colored - 1 : self.colored + 1
    }

    func tapSpheroInteraction() {
        self.tapSphero!.sensorControl.enable(sensors: SensorMask.init(arrayLiteral: .accelerometer,.gyro))
        self.tapSphero!.sensorControl.interval = 1
        self.tapSphero!.setStabilization(state: SetStabilization.State.off)
        var previousY = 15.0
        if (self.isActive && self.interactionStart.contains("tapSphero")){
            
            self.tapSphero!.sensorControl.onDataReady = { data in
                DispatchQueue.main.async {
                    if let acceleration = data.accelerometer?.filteredAcceleration {
                        if (self.tapCount < self.maxTap) {
                            if (acceleration.y! > previousY+0.030 && self.isActive){
                                self.tapSpheroTapDone()
                                previousY = acceleration.y! + 0.5
                            } else {
                                previousY = acceleration.y!
                            }
                        }
                    }
                }
            }
        } else {
            return
        }
    }
    
    func tapSpheroTapDone() {
        self.tapCount = self.tapCount + 1
        if (self.typeInteraction == "audio") {
            self.playingAudio(interaction: "tapSphero")
        }
        if (self.tapCount.isMultiple(of: 2)) {
            self.lightInteractSphero(sphero: "tap")
        }
        if (self.tapCount.isMultiple(of: self.multipleRemoveLine)){
            self.narratorRemoveLineColor()
        }
        if (self.tapCount == self.maxTap) {
            self.finishInteract(interaction: "tapSphero")
        }
    }
    
    func turnSpheroInteraction(){
        self.turnSphero!.sensorControl.enable(sensors: SensorMask.init(arrayLiteral: .accelerometer,.gyro))
        self.turnSphero!.sensorControl.interval = 1
        self.turnSphero!.setStabilization(state: SetStabilization.State.off)
        if (self.isActive && self.interactionStart.contains("turnSphero")){
            self.turnSphero!.sensorControl.onDataReady = { data in
                DispatchQueue.main.async {
                    if let acceleration = data.accelerometer?.filteredAcceleration {
                        if (self.turnCount < self.maxTurn) {
                            if (acceleration.z! > 0.7){
                                if (self.turnRotation == 0.75) {
                                    self.turnSpheroTurnDone()
                                }
                            }
                            if (acceleration.z! < 0.5 && acceleration.z! > -0.5) {
                                if (self.turnRotation == 0) {
                                    self.turnRotation = 0.25
                                } else if (self.turnRotation == 0.5) {
                                    self.turnRotation = 0.75
                                }
                            }
                            if (acceleration.z! < 0.5) {
                                if (self.turnRotation == 0.25) {
                                    self.turnRotation = 0.5
                                }
                            }
                        } else {
                            self.turnRotation = 0.0
                            
                        }
                    }
                }
            }
        } else {
            self.turnSphero!.setStabilization(state: SetStabilization.State.on)
            return
        }
    }
    
    func turnSpheroTurnDone() {
        self.turnRotation = 0.0
        self.turnCount = self.turnCount + 1
        if (self.typeInteraction == "audio") {
            self.playingAudio(interaction: "turnSphero")
        }
        if (self.turnCount.isMultiple(of: 2)) {
            self.lightInteractSphero(sphero: "turn")
        }
        if (self.turnCount.isMultiple(of: self.multipleRemoveLine)) {
            self.narratorRemoveLineColor()
        }
        if (self.turnCount == self.maxTurn) {
            self.finishInteract(interaction: "turnSphero")
        }
    }
    
    func startStory() {
        if (!self.storyStarted) {
            self.soundPlayer.playBackgroundAudio(soundFileName: self.chapterC.backgroundMusic)
        }
        self.storyStarted = true
        self.narratorRemoveLineColor()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block:{_ in self.timerFunc()})
    }
    
    func timerFunc() {
        if (!self.isActive && !self.narratorColored && self.storyStarted) {
                self.startStory()
        }
    }
    
    func websocketInteraction(idInput:String) {
        if (idInput == "button1" && self.button1 < 8) {
            self.button1 = self.button1 + 1
            if (self.button1.isMultiple(of: self.multipleRemoveLine)) {
                self.narratorRemoveLineColor()
            }
            if (self.button1 == 8) {
                finishInteract(interaction: "button1")
            }
            if (self.typeInteraction == "audio") {
                self.playingAudio(interaction: idInput)
            }
        }
        if (idInput == "button2" && self.button2 < 8) {
            self.button2 = self.button2 + 1
            if (self.button2.isMultiple(of: self.multipleRemoveLine)) {
                self.narratorRemoveLineColor()
            }
            if (self.button2 == 8) {
                finishInteract(interaction: "button2")
            }
            if (self.typeInteraction == "audio") {
                self.playingAudio(interaction: idInput)
            }
        }
        if (idInput == "rotocoder" && self.rotocoder < 8) {
            self.rotocoder = self.rotocoder + 1
            if (self.rotocoder.isMultiple(of: self.multipleRemoveLine)) {
                self.narratorRemoveLineColor()
            }
            if (self.rotocoder == 8) {
                finishInteract(interaction: "rotocoder")
            }
            if (self.typeInteraction == "audio") {
                self.playingAudio(interaction: idInput)
            }
        }
        if (idInput == "micro" && self.micro < 8) {
            self.micro = self.micro + 1
            if (self.micro.isMultiple(of: self.multipleRemoveLine)) {
                self.narratorRemoveLineColor()
            }
            if (self.typeInteraction == "audio") {
                self.playingAudio(interaction: idInput)
            }
            if (self.micro == 8) {
                finishInteract(interaction: "micro")
            }
        }
        if (idInput == "tapSphero" && self.tapCount < 8) {
            self.tapSpheroTapDone()
        }
        if (idInput == "turnSphero" && self.turnCount < 8) {
            self.turnSpheroTurnDone()
        }
    }
    
    func webSocketMessage(messages:[WebSocketMessage], ws:WebsocketObservable, wsRover:WebsocketObservable, roverfunc:RoverFunc) {
        if var message = messages.last {
            if (message.name == "rpi") {
                if (message.idInput != nil) {
                    self.websocketInteraction(idInput: message.idInput!)
                }
            }
            if (message.name == "interact") {
                if (message.idInput == nil) {
                    if (message.value == "true") {
                        self.startInteraction(type: message.value, ws: ws)
                        if (message.value == "audio") {
                            roverfunc.roverTurn(ws: wsRover)
                            var ledColor = WebSocketMessage(name: "leds", value: "\(self.chapterC.interactionColor)").toJsonString()
                            if (ledColor != nil) {
                                ws.sendString(string:ledColor!)
                            }
                            
                        }
                        roverfunc.stopAndGetPosition(ws: wsRover)
                    } else {
                        self.stopInteraction()
                        roverfunc.roverStart(ws:wsRover)
                        var ledColor = WebSocketMessage(name: "leds", value: "[(76, 207, 215)]").toJsonString()
                        if (ledColor != nil) {
                            ws.sendString(string:ledColor!)
                        }
                    }
                }
                else {
                    self.changeInteractSelect()
                }
            }
            if (message.name == "chapter") {
                self.nextChapter()
                roverfunc.roverHome(ws: wsRover)
                var ledColor = WebSocketMessage(name: "leds", value: "[(76, 207, 215)]").toJsonString()
                if (ledColor != nil) {
                    ws.sendString(string:ledColor!)
                }
            }
            if (message.name == "story") {
                self.startStory()
                roverfunc.roverStart(ws:wsRover)
                var ledColor = WebSocketMessage(name: "leds", value: "[(76, 207, 215)]").toJsonString()
                if (ledColor != nil) {
                    ws.sendString(string:ledColor!)
                }
            }
        }
        
    }
    
    func changeInteractSelect() {
        var interacts = ["tapSphero"]
        for interact in interacts {
            self.interactionStart.append(interact)
            if (interact == "turnSphero") {
                self.turnSphero?.drawMatrix(fillFrom: Pixel(x:0, y:0), to: Pixel(x: 7, y: 7), color: .green)
                self.turnSpheroInteraction()
            }
            if (interact == "tapSphero") {
                self.tapSphero?.drawMatrix(fillFrom: Pixel(x:0, y:0), to: Pixel(x: 7, y: 7), color: .green)
                self.tapSpheroInteraction()
            }
        }
    }
    
    func lightInteractSphero(sphero:String) {
        if (sphero == "turn") {
            self.turnSphero?.drawMatrix(fillFrom: Pixel(x:self.turnColored, y:0), to: Pixel(x: self.turnColored + 1, y: 7), color: .clear)
            self.turnColored = self.turnColored + 2
        }
        if (sphero == "tap") {
            self.tapSphero?.drawMatrix(fillFrom: Pixel(x:self.tapColored, y:0), to: Pixel(x: self.tapColored + 1, y: 7), color: .clear)
            self.tapColored = self.tapColored + 2
        }
    }
    
    func finishInteract(interaction:String) {
        if (!self.interactionFinished.contains(interaction)) {
            self.interactionFinished.append(interaction)
        }
        if (self.interactionStart.sorted() == self.interactionFinished.sorted()) {
            self.narratoSphero?.clearMatrix()
        }
    }
    
    func nextChapter() {
        self.soundPlayer.pauseBackgroundM()
        if (self.currentChapter == 0) {
            self.soundPlayer.playSound(soundFileName: "start-chapter-end", fileType: "wav")
        }
        print(self.currentStory.chapters)
        self.storyStarted = false
        if (self.currentStory.chapters[self.currentChapter] != self.currentStory.chapters.last) {
            self.currentChapter += 1
        } else {
            self.currentChapter = 0
        }
        print(self.currentChapter)
        self.chapterC = self.currentStory.chapters[self.currentChapter]
        
    }
    
    func playingAudio(interaction:String) {
        var sound = self.chapterC.audioInteraction[interaction]
        if (sound != nil) {
            self.soundPlayer.playSound(soundFileName: sound!)
        }
    }
    
    func sendInteractionWs(ws:WebsocketObservable, interactions:[String]) {
        print(interactions)
        var newMessage = WebSocketStartInteract(name: "interact")
        for interact in interactions {
            newMessage.value[interact] = "true"
        }
        if (newMessage.value.count > 0) {
            var message = newMessage.toJsonString()
            if (message != nil) {
                ws.sendString(string: message!)
            }
        }
    }
    
    func randomChapter() {
        self.currentStory.chapters = []
        for chap in self.currentStory.chosingFromChapter.keys.sorted(by: { a, b in
            return a < b
        }) {
            if self.currentStory.chosingFromChapter[chap]!.count == 1 {
                self.currentStory.chapters.append( self.currentStory.chosingFromChapter[chap]![0])
            } else {
                var random = Int.random(in: 0..<self.currentStory.chosingFromChapter[chap]!.count)
                self.currentStory.chapters.append(self.currentStory.chosingFromChapter[chap]![random])
            }
        }
        self.currentChapter = 0
        self.chapterC = self.currentStory.chapters[0]
    }
    
    func resumeSphero(ws:WebsocketObservable) {
        if (self.isActive) {
            self.startInteraction(type: self.typeInteraction, ws: ws)
        } else {
            self.stopInteraction()
        }
    }
}

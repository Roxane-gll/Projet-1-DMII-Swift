//
//  SpheroObservable.swift
//  RVR_Brain
//
//  Created by RG on 07/01/2024.
//

import Foundation
import SwiftUI

class SpheroObservable:ObservableObject {
    var soundPlayer = SoundPlayer()
    
    @Published var currentStory:Story = story1
    @Published var currentChapter:Int = 0
    @Published var chapterC:Chapter = story1.chapters[0]

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
    
    @Published var interactionStart = [String]()
    var multipleRemoveLine = 4
    var interactionFinished = [String]()
    var typeInteraction = "visual"
    
    func startInteraction(type:String) {
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
        self.selectInteraction(type: type)
        
    }
    
    func selectInteraction(type:String) {
        let interacts = type == "audio" ? Array(self.chapterC.audioInteraction.keys) : self.chapterC.visualIntraction
        if (interacts.count <= 2) {
            self.multipleRemoveLine = 1
        } else {
            self.multipleRemoveLine = interacts.count <= 4 ? 2 : 4
        }
        for interact in interacts {
            print(interact)
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
        print("active: \(self.isActive), in: \(self.interactionStart)")
        if (self.isActive && self.interactionStart.contains("tapSphero")){
            
            self.tapSphero!.sensorControl.onDataReady = { data in
                DispatchQueue.main.async {
                    if let acceleration = data.accelerometer?.filteredAcceleration {
                        if (self.tapCount < self.maxTap) {
                            print(acceleration.y!, previousY)
                            if (acceleration.y! > previousY+0.030 && self.isActive){
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
    
    func startStory() {
        self.narratorRemoveLineColor()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block:{_ in self.timerFunc()})
    }
    
    func timerFunc() {
        if (!self.isActive && !self.narratorColored) {
                self.startStory()
        }
    }
    
    func websocketInteraction(idInput:String) {
        if (idInput == "button1" && self.button1 < 8) {
            self.button1 = self.button1 + 1
            if (self.button1.isMultiple(of: self.multipleRemoveLine)) {
                self.narratorRemoveLineColor()
            }
        }
        if (idInput == "button2" && self.button2 < 8) {
            self.button2 = self.button2 + 1
            if (self.button2.isMultiple(of: self.multipleRemoveLine)) {
                self.narratorRemoveLineColor()
            }
        }
        if (idInput == "rotocoder" && self.rotocoder < 8) {
            self.rotocoder = self.rotocoder + 1
            if (self.rotocoder.isMultiple(of: self.multipleRemoveLine)) {
                self.narratorRemoveLineColor()
            }
        }
        if (self.typeInteraction == "audio") {
            self.playingAudio(interaction: idInput)
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
        if (self.interactionFinished.count == self.interactionStart.count) {
            self.stopInteraction()
        }
    }
    
    func nextChapter() {
        if (self.currentChapter <= self.currentStory.chapters.count) {
            self.currentChapter += 1
            self.chapterC = self.currentStory.chapters[self.currentChapter]
        }
    }
    
    func playingAudio(interaction:String) {
        var sound = self.chapterC.audioInteraction[interaction]
        if (sound != nil) {
            print(sound!)
            self.soundPlayer.playSound(soundFileName: sound!)
        }
        
    }
}

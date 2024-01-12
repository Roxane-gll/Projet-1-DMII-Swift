//
//  SoundPlayer.swift
//  RVR_Brain
//
//  Created by RG on 11/01/2024.
//

import Foundation
import AVFoundation

class SoundPlayer : AVAudioPlayerDelegate {
    var hash: Int = 0
    
    var superclass: AnyClass?
    
    var description: String = ""
    
    var audioPlayer = [AVAudioPlayer]()

    func playSound(soundFileName: String, fileType: String = "mp3") {
        if let path = Bundle.main.path(forResource: soundFileName, ofType: fileType) {
            let url = URL(fileURLWithPath: path)
            do {
                var newPlayer = try AVAudioPlayer(contentsOf: url)
                if (newPlayer != nil) {
                    newPlayer.delegate = self
                    audioPlayer.append(newPlayer)
                    audioPlayer.last?.play()
                }
            } catch {
                print("Erreur lors de la lecture du son : \(error.localizedDescription)")
            }
        } else {
            print("Fichier son non trouvé.")
        }
        
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            if let index = audioPlayer.firstIndex(of: player) {
                audioPlayer.remove(at: index)
            }
        }
    }
}

extension SoundPlayer {
    func isEqual(_ object: Any?) -> Bool {
        guard let otherObject = object as? SoundPlayer else {
            return false
        }
        return self.hash == otherObject.hash
    }
    
    func `self`() -> Self {
        return self
    }
    
    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
        return Unmanaged.passUnretained(self)
    }
    
    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
        return Unmanaged.passUnretained(self)
    }
    
    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
        return Unmanaged.passUnretained(self)
    }
    
    func isProxy() -> Bool {
        return false
    }
    
    func isKind(of aClass: AnyClass) -> Bool {
        return false
    }
    
    func isMember(of aClass: AnyClass) -> Bool {
        return false
    }
    
    func conforms(to aProtocol: Protocol) -> Bool {
        return false
    }
    
    func responds(to aSelector: Selector!) -> Bool {
        return false
    }
}

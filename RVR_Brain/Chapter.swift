//
//  Chapter.swift
//  RVR_Brain
//
//  Created by RG on 10/01/2024.
//

import Foundation

struct Chapter : Equatable, Identifiable {
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id:Int
    var titleC:String
    var textL:[TextChapter]
    var visualIntraction:[String]
    var audioInteraction:[String:String]
    var image:String
    var backgroundMusic:String
    var interactionColor = [(76,207,215),(200,100,153), (209,197,30)]
}

struct TextChapter: Identifiable, Hashable {
    var id=UUID().uuidString
    
    var typeC:String
    var txt:String
    var dialog:[String: String]
    var citation:[String:String]
}




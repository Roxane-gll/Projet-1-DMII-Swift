//
//  Story.swift
//  RVR_Brain
//
//  Created by RG on 10/01/2024.
//

import Foundation
struct Story:Equatable {
    var id:Int
    var title:String
    var chapters:[Chapter]
    var chosingFromChapter:[Int:[Chapter]]
}



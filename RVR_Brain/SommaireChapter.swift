//
//  SommaireChapter.swift
//  RVR_Brain
//
//  Created by digital on 12/01/2024.
//

import SwiftUI

struct SommaireChapter: View {
    var currentChapter:Int
    var chapterObj:Chapter
    var chapter:Int
    
    var body: some View {
        HStack{
            Text("Chapitre \(chapter + 1)").font(.custom("Satoshi-Black", size: 18))
            Text("- \(self.chapterObj.titleC)").font(.custom("Satoshi-Regular", size: 18))
            Spacer()
        }.foregroundColor(self.currentChapter == chapter ? Color(red: 0.56, green: 0.63, blue: 0.0) : Color.black).padding().frame(width:300).background(self.currentChapter == chapter ? Color(red: 0.78, green: 0.85, blue: 0.3, opacity: 0.25) : Color.clear)
    }
}

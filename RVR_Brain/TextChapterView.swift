//
//  TextChapterView.swift
//  RVR_Brain
//
//  Created by RG on 11/01/2024.
//

import SwiftUI

struct TextChapterView: View {
    var chapter:[TextChapter]
    
    var body: some View {
        VStack {
            ForEach(self.chapter, id:\.self) {textChap in
                if (textChap.typeC == "text") {
                    Text(textChap.txt).font(.custom("Satoshi-Bold", size: 20)).frame(width:700)
                }
                if (textChap.typeC == "citation") {
                    ForEach(Array(textChap.citation.keys), id:\.self) { key in
                        HStack {
                            Image(key).padding([.leading, .top, .bottom])
                            Rectangle().fill(Color(red:0.91, green:0.19, blue:0.52)).frame(width:3).padding()
                            Text("\(textChap.citation[key]!)").padding().foregroundColor(Color(red:0.91, green:0.19, blue:0.52)).font(.custom("Satoshi-Regular", size: 20)).lineSpacing(10)
                            Spacer()
                        }.background(Color(red:0.91, green:0.19, blue:0.52, opacity: 0.05)).cornerRadius(8).padding([.top, .bottom])
                    }
                }
                if (textChap.typeC == "dialog") {
                    ForEach(Array(textChap.dialog.keys).reversed(), id:\.self) { key in
                        HStack {
                            Rectangle().fill(Color(red:0.91, green:0.19, blue:0.52)).padding().frame(width:35)
                            Text("\(key) : ").font(.custom("Satoshi-Black", size: 20))
                            Text(textChap.dialog[key]!).padding().font(.custom("Satoshi-Bold", size: 20))
                            Spacer()
                        }
                    }
                }
            }
        }.foregroundColor(.black).frame(width:725)
            
    }
}

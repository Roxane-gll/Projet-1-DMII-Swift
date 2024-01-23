//
//  TopBar.swift
//  RVR_Brain
//
//  Created by digital on 19/01/2024.
//

import SwiftUI

struct TopBar: View {
    var chapterInt = 0
    var chapterObj:Chapter = chapterStart
    
    var body: some View {
        HStack {
            HStack{
                Text("Chapitre \(self.chapterInt) - ").padding(.leading, 30).font(.custom("Satoshi-Black", size: 24))
                Text("\(self.chapterObj.titleC)").font(.title2).font(.custom("Satoshi-Regular", size: 20))
                Spacer()
            }.padding([.trailing, .leading],20).frame(width: 775,height: 121).background(Color.white.opacity(0.75)).foregroundColor(.black)
        }.frame(width:735).background {
            Image(self.chapterObj.image).resizable().scaledToFill().frame(width: 775,height: 121).clipped()
        }
    }
}

#Preview {
    TopBar()
}

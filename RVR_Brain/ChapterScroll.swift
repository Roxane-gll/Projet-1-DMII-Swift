//
//  ChapterScroll.swift
//  RVR_Brain
//
//  Created by digital on 19/01/2024.
//

import SwiftUI

struct ChapterScroll: View {
    var textChapter = chapterStart.textL
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TextChapterView(chapter: textChapter).padding(.leading, 35)
            }.frame(width: 725).padding([.top, .bottom], 45)
        }.frame(width:700)
    }
}

#Preview {
    ChapterScroll()
}

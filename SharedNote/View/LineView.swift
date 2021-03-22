//
//  LineView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/22/21.
//

import SwiftUI

struct LineView: View {
    let text: String
    @State private var expand: Bool = false
    @State private var lines: Int = 1

    var body: some View {
        Text(text)
            .font(.body)
            .lineLimit(lines)
            .onTapGesture {
                toggleExpand()
            }
            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
    }
    
    func toggleExpand() {
        if expand {
            lines = 1000
            expand = false
        } else {
            lines = 1
            expand = true
        }
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(text: Note.testData[2].text)
    }
}

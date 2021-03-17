//
//  CreateView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/15/21.
//

import SwiftUI

struct CreateView: View {
    @State private var note: String = "Make a note..."
    var body: some View {
        TextEditor(text: $note)
            .font(.custom("HelveticaNeue", size: 18))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

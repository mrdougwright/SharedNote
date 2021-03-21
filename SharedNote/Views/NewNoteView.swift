//
//  NewNoteView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/21/21.
//

import SwiftUI

struct NewNoteView: View {
    @State private var note: String = ""

    func saveNote() {
        print($note)
    }

    var body: some View {
        VStack(spacing: 10) {
            HStack() {
                Text("write a note")
                    .font(.largeTitle)
                Image(systemName: "pencil")
                    .imageScale(.large)
            }

            TextField("bla bla bla...", text: $note)
                .disableAutocorrection(true)
                .frame(height: 300)
                .padding()

            Button(action: saveNote) {
                Text("Save Note")
                Image(systemName: "square.and.arrow.down")
            }
            .padding()
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}

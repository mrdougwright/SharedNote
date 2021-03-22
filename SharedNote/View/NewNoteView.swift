//
//  NewNoteView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/21/21.
//

import SwiftUI

struct NewNoteView: View {
    var viewModel = NotesViewModel()
    @State private var text: String = ""
    
    func saveNote() {
        self.viewModel.saveNote(text: self.text)
        self.text = ""
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack() {
                Text("write a note")
                    .font(.largeTitle)
                Image(systemName: "pencil")
                    .imageScale(.large)
            }

            TextField("bla bla bla...", text: $text)
                .disableAutocorrection(true)
                .frame(height: 300)
                .padding()

            Button(action: saveNote) {
                Text("Save Note")
                Image(systemName: "square.and.arrow.down")
            }
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(20)
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}

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
        viewModel.saveNote(text: text)
        text = ""
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack() {
                Text("write a note")
                    .font(.largeTitle)
                Image(systemName: "pencil")
                    .imageScale(.large)
            }
            .padding(.bottom, 80)

            TextField("bla bla bla...", text: $text)
                .disableAutocorrection(true)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 300, height: 30, alignment: .center)
                .padding()
                .padding(.bottom, 20)

            Button(action: saveNote) {
                Text("Save Note")
                Image(systemName: "square.and.arrow.down")
            }
            .padding(14)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(10)
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}

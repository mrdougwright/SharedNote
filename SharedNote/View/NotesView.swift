//
//  NotesView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/16/21.
//

import SwiftUI

struct NotesView: View {
    var viewModel = NotesViewModel()
    let notes: [Note]
    
    func deleteNote(_ documentId: String) {
        self.viewModel.deleteNote(documentId: documentId)
    }

    var body: some View {
        List(notes) { note in
            HStack() {
                LineView(text: note.text)
                Spacer()

                Text(note.author)
                    .font(.subheadline)
                    .opacity(0.5)

                Button(action: { deleteNote(note.id) }) {
                    Image(systemName: "trash")
                }
                .buttonStyle(BorderlessButtonStyle())
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(notes: Note.testData)
    }
}

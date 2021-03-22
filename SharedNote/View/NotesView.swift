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
                Text(note.text)
                    .font(.body)
                Spacer()
                Text(note.author)
                    .font(.subheadline)
                Button(action: { deleteNote(note.id) }) {
                    Image(systemName: "trash")
                }
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

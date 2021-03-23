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
    
    func deleteNote(at offsets: IndexSet) {
        for index in offsets {
            viewModel.deleteNote(documentId: notes[index].id)
        }
    }

    var body: some View {
        List {
            ForEach(notes) { note in
                HStack() {
                    LineView(id: note.id, text: note.text)
                    Spacer()

                    Text(note.author)
                        .font(.subheadline)
                        .opacity(0.5)
                }
            }.onDelete(perform: deleteNote)
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(notes: Note.testData)
    }
}

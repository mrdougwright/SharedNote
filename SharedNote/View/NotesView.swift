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
    
    var body: some View {
        List {
            ForEach(notes) { note in
                let date = prettyDate(note.created)
                
                HStack() {
                    LineView(id: note.id, text: note.text)
                    Spacer()

                    VStack() {
                        Text(note.author)
                            .font(.subheadline)
                            .opacity(0.3)
                        
                        Text(date)
                            .font(.subheadline)
                            .opacity(0.5)
                    }
                }
            }.onDelete(perform: deleteNote)
        }
    }
    
    func prettyDate(_ created: TimeInterval) -> String {
        let dateObj = Date(timeIntervalSince1970: created)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: dateObj)
        
        return date
    }
    
    func deleteNote(at offsets: IndexSet) {
        for index in offsets {
            viewModel.deleteNote(documentId: notes[index].id)
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(notes: Note.testData)
    }
}

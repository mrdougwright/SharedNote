//
//  NotesView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/16/21.
//

import SwiftUI

struct NotesView: View {
    let notes: [Note]

    var body: some View {
        List(notes) { note in
            HStack() {
                Text(note.text)
                    .font(.headline)
                Text(note.author)
                    .font(.subheadline)
            }
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(notes: Note.testData)
    }
}

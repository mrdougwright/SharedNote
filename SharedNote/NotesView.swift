//
//  NotesView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/16/21.
//

import SwiftUI

struct NotesView: View {
    let notes: [Note]

    init() {
        // hardcoding to fake data temporarily; this should be firebase data
        let url = Bundle.main.url(forResource: "notes", withExtension: "json")!

        let data = try! Data(contentsOf: url)
        notes = try! JSONDecoder().decode([Note].self, from: data)
    }

    var body: some View {
        List(notes, id: \.text) { note in
            Text(note.text)
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}

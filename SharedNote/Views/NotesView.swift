//
//  NotesView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/16/21.
//

import SwiftUI

struct NotesView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        List(modelData.notes, id: \.text) { note in
            Text(note.text)
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
            .environmentObject(ModelData())
    }
}

//
//  ContentView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = NotesViewModel()

    var body: some View {
        TabView {
            NavigationView {
                NewNoteView()
            }
            .tabItem {
                Image(systemName: "pencil")
                Text("New")
            }

            NavigationView {
                NotesView(notes: viewModel.notes)
            }
            .tabItem {
                Image(systemName: "lineweight")
                Text("Notes")
            }
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

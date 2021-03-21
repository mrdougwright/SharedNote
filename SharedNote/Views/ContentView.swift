//
//  ContentView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/21/21.
//

import SwiftUI

struct ContentView: View {
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
                NotesView()
            }
            .tabItem {
                Image(systemName: "lineweight")
                Text("Notes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

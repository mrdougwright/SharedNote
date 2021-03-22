//
//  ContentView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tagNumber: Int = 0
    @ObservedObject var viewModel = NotesViewModel()

    var body: some View {
        TabView(selection: $tagNumber) {
            NavigationView {
                NewNoteView()
            }
            .tabItem {
                Image(systemName: "pencil")
                Text("New")
            }
            .tag(0)
            .gesture(
                DragGesture(minimumDistance: 50).onEnded { value in
                    if value.translation.width < 0 {
                        tagNumber = 1
                    }
                }
            )

            NavigationView {
                NotesView(notes: viewModel.notes)
            }
            .tabItem {
                Image(systemName: "lineweight")
                Text("Notes")
            }
            .tag(1)
            .gesture(
                DragGesture(minimumDistance: 50).onEnded { value in
                    if value.translation.width > 0 {
                        tagNumber = 0
                    }
                }
            )
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

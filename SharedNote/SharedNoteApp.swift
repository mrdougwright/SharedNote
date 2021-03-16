//
//  SharedNoteApp.swift
//  SharedNote
//
//  Created by Doug Wright on 3/15/21.
//

import FirebaseDatabase
import SwiftUI

@main
struct SharedNoteApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView()
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
}

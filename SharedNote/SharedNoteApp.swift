//
//  SharedNoteApp.swift
//  SharedNote
//
//  Created by Doug Wright on 3/15/21.
//

import SwiftUI

@main
struct SharedNoteApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

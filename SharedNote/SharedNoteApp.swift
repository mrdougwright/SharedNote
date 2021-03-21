//
//  SharedNoteApp.swift
//  SharedNote
//
//  Created by Doug Wright on 3/15/21.
//

import Firebase
import SwiftUI

@main
struct SharedNoteApp: App {
    @StateObject private var modelData = ModelData()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

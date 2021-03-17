//
//  Notes.swift
//  
//
//  Created by Doug Wright on 3/16/21.
//

import FirebaseDatabase
import Foundation

class Notes: ObservableObject {
    var ref: DatabaseReference!

    init() {
        ref = Database.database().reference()
        getNotes()
        saveNote(value: "mwa haha")
    }

    func saveNote(value: NSString) {
        let data = Note(text: value as String, author: "doug from code", timestamp: "1-1-1")
        ref.child("notes").child("id3").setValue(["text": data.text, "author": data.author, "timestamp": data.timestamp])
    }

    func getNotes() {
        ref.child("notes").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
            }
            else {
                print("No data available")
            }
        }
    }
}

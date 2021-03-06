//
//  NotesViewModel.swift
//  SharedNote
//
//  Created by Doug Wright on 3/21/21.
//

import Foundation
import FirebaseFirestore

class NotesViewModel: ObservableObject {
    @Published var notes = [Note]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("notes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.notes = documents.map { queryDocumentSnapshot -> Note in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let author = data["author"] as? String ?? ""
                let text = data["text"] as? String ?? ""
                let created = data["created"] as? TimeInterval ?? 0.0
                
                return Note(id: id, author: author, text: text, created: created)
            }
            .sorted {
                $0.created > $1.created
            }
        }
    }
    
    func saveNote(text: String) {
        let note = buildNote(text)
        db.collection("notes").addDocument(data: note)
    }

    func deleteNote(documentId: String) {
        db.collection("notes").document(documentId).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
    }

    func updateNote(documentId: String, text: String) {
        let note = buildNote(text)

        db.collection("notes")
            .document(documentId)
            .updateData(note) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("Document successfully updated!")
            }
        }
    }
    
    private func buildNote(_ text: String) -> [String: Any] {
        return [
            "author": UIDevice.current.name,
            "text": text,
            "created": NSDate().timeIntervalSince1970
        ]
    }
}

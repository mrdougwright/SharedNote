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
                let author = data["author"] as? String ?? ""
                let text = data["text"] as? String ?? ""
                
                return Note(id: .init(), author: author, text: text)
            }
        }
    }
}

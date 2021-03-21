//
//  ModelData.swift
//  SharedNote
//
//  Created by Doug Wright on 3/21/21.
//
import Combine
import FirebaseDatabase
import Foundation

final class ModelData: ObservableObject {
    @Published var notes: [Note] = load("notes")
}

func load<T: Decodable>(_ key: String) -> T {
    var data: Any = []
    var ref: DatabaseReference!

    ref = Database.database().reference()
    
    ref.child(key).getData { (error, snapshot) in
        if let error = error {
            print("Error getting data \(error)")
        }
        else if snapshot.exists() {
            let value = snapshot.value as? NSDictionary
            let id1 = value?["id1"] as? NSDictionary ?? [:]

            print("Got data => \(value)")
            print("first: \(id1)")
            data = value
        }
        else {
            print("No data available")
        }
    }
    return data as! T
}


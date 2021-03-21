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
//    var data: Data
    var ref: DatabaseReference!

    ref = Database.database().reference()
    
    ref.child(key).getData { (error, snapshot) in
        if let error = error {
            print("Error getting data \(error)")
        }
        else if snapshot.exists() {
            print("Got data \(snapshot.value!)")
            print("Type: \(type(of: snapshot.value))")
//            data = snapshot.value as! Data
        }
        else {
            print("No data available")
        }
    }

//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Flap")
//    }
    return [] as! T
}


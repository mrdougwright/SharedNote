//
//  Note.swift
//  SharedNote
//
//  Created by Doug Wright on 3/16/21.
//

import Foundation

struct Note: Identifiable {
    let id: String
    let author: String
    let text: String
//    let timestamp: TimeInterval

    static let testData = [
        Note(id: "1", author: "Doug Wright", text: "example note"),
        Note(id: "2", author: "Jane Kim", text: "lets go to park")
    ]
}

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
    let created: Float

    static let testData = [
        Note(id: "1", author: "Doug Wright", text: "example note", created: 1616374386.745393),
        Note(id: "2", author: "Jane Kim", text: "lets go to park", created: 1616374387.745393)
    ]
}

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
        Note(id: "2", author: "Jane Kim", text: "lets go to park", created: 1616374387.745393),
        Note(id: "3", author: "Jane Kim", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", created: 1616374388.745393),
    ]
}

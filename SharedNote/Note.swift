//
//  Note.swift
//  SharedNote
//
//  Created by Doug Wright on 3/16/21.
//

import Foundation

struct Note: Decodable {
    let text: String
    let author: String
    let timestamp: String

    static let examples = [
        Note(text: "example note", author: "Doug Wright", timestamp: "right meow")
    ]
}

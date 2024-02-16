//
//  Comment.swift
//  Acebook
//
//  Created by Fawaz Tarar on 16/02/2024.
//

import Foundation

struct Comment: Identifiable, Codable {
    let id: UUID
    var username: String
    var content: String

    init(id: UUID = UUID(), username: String, content: String) {
        self.id = id
        self.username = username
        self.content = content
    }
}

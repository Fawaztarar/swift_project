//
//  Post.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import Foundation

struct Post: Identifiable {
    let id: UUID = UUID() // Provides a unique identifier
    var username: String  // Add this line
    var content: String
    
    // Example Posts for Preview
    static let example1 = Post(username: "user1", content: "Hello World!")
    static let example2 = Post(username: "user2", content: "This is a post.")
}


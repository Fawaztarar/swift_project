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
    var createdAt: Date
    var comments: [Comment] = []
    
    
    
    
    
    // Example Posts for Preview
    static let example1 = Post(username: "user1", content: "Hello World!", createdAt: Date())
    static let example2 = Post(username: "user2", content: "This is a post.", createdAt: Date().addingTimeInterval(-86400)) // 1 day ago
    static let example3 = Post(username: "adventure_123", content: "Just climbed the highest mountain!", createdAt: Date().addingTimeInterval(-2_592_000)) // 1 month ago
    static let example4 = Post(username: "booklover", content: "Finished reading a great novel today.", createdAt: Date().addingTimeInterval(-604_800)) // 1 week ago
    static let example5 = Post(username: "tech_guru", content: "Exploring SwiftUI. It's awesome!", createdAt: Date().addingTimeInterval(-1_209_600)) // 2 weeks ago
    static let example6 = Post(username: "nature_photographer", content: "Captured a beautiful sunset.", createdAt: Date().addingTimeInterval(-3_600)) // 1 hour ago
}


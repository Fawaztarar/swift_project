//
//  Post.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import Foundation

struct Post: Identifiable, Equatable {
    let id: UUID
    var username: String
    var content: String
    var createdAt: Date
    var comments: [Comment] = []
    var likes: Int = 0
    var isLiked: Bool = false
    let profilePicture: String // Add profile picture property

    init(id: UUID = UUID(), username: String, content: String, createdAt: Date = Date(), likes: Int = 0, isLiked: Bool = false, profilePicture: String) {
        self.id = id
        self.username = username
        self.content = content
        self.createdAt = createdAt
        self.likes = likes
        self.isLiked = isLiked
        self.profilePicture = profilePicture // Initialize profile picture property
    }

    // Example Posts for Preview
    static let example1 = Post(id: UUID(), username: "user1", content: "Hello World!", createdAt: Date(), profilePicture: "profile3.png")
    static let example2 = Post(id: UUID(), username: "user2", content: "This is a post.", createdAt: Date().addingTimeInterval(-86400), profilePicture: "profile2.png") // 1 day ago
    static let example3 = Post(id: UUID(), username: "adventure_123", content: "Just climbed the highest mountain!", createdAt: Date().addingTimeInterval(-2_592_000), profilePicture: "profile2.png") // 1 month ago
    static let example4 = Post(id: UUID(), username: "booklover", content: "Finished reading a great novel today.", createdAt: Date().addingTimeInterval(-604_800), profilePicture: "profile4.png") // 1 week ago
    static let example5 = Post(id: UUID(), username: "tech_guru", content: "Exploring SwiftUI. It's awesome!", createdAt: Date().addingTimeInterval(-1_209_600), profilePicture: "profile5") // 2 weeks ago
    static let example6 = Post(id: UUID(), username: "nature_photographer", content: "Captured a beautiful sunset.", createdAt: Date().addingTimeInterval(-3_600), profilePicture: "profile6") // 1 hour ago
}

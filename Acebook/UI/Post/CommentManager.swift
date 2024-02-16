//
//  CommentManager.swift
//  Acebook
//
//  Created by Fawaz Tarar on 16/02/2024.
//

import Foundation

import Foundation

class CommentManager {
    static let shared = CommentManager()
    
    private init() {}
    
    func addComment(to post: inout Post, content: String, username: String = "currentUsername") {
        // This is a simplified example. In a real app, you'd likely make an API call to add the comment.
        let newComment = Comment(username: username, content: content)
        post.comments.append(newComment)
    }
}

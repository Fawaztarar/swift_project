//
//  CommentFunctions.swift
//  Acebook
//
//  Created by Fawaz Tarar on 17/02/2024.
//

import Foundation


func addComment(post: inout Post, newCommentText: String, draftUsername: String) {
    let newComment = Comment(id: UUID(), username: draftUsername, content: newCommentText)
    post.comments.append(newComment)
}

func updateComment(post: inout Post, updatedComment: Comment) {
    if let index = post.comments.firstIndex(where: { $0.id == updatedComment.id }) {
        post.comments[index] = updatedComment
    }
}

func deleteComment(post: inout Post, commentToDelete: Comment) {
    post.comments.removeAll { $0.id == commentToDelete.id }
}

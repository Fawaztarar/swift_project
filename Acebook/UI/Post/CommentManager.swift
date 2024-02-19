//
//  CommentManagwe.swift
//  Acebook
//
//  Created by Fawaz Tarar on 17/02/2024.
//

import Foundation

class CommentManager {
    func addComment(to post: inout Post, newComment: Comment) {
        post.comments.append(newComment)
    }

    func updateComment(post: inout Post, updatedComment: Comment) {
        if let index = post.comments.firstIndex(where: { $0.id == updatedComment.id }) {
            post.comments[index] = updatedComment
        }
    }

    func deleteComment(post: inout Post, commentID: UUID) {
        post.comments.removeAll { $0.id == commentID }
    }
}

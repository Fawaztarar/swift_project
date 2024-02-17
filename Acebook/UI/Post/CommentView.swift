////
////  CommentView.swift
////  Acebook
////
////  Created by Fawaz Tarar on 16/02/2024.
////
//

import Foundation
import SwiftUI

struct CommentView: View {
    let comment: Comment
    var onUpdate: (Comment) -> Void
    var onDelete: (Comment) -> Void
    @State private var isEditing = false
    @State private var editedContent: String

    init(comment: Comment, onUpdate: @escaping (Comment) -> Void, onDelete: @escaping (Comment) -> Void) {
        self.comment = comment
        self.onUpdate = onUpdate
        self.onDelete = onDelete
        _editedContent = State(initialValue: comment.content)
    }

    var body: some View {
        HStack {
            if isEditing {
                TextField("", text: $editedContent)
            } else {
                Text(comment.username).bold()
                Text(comment.content)
            }
            Spacer()
            Button(action: {
                onUpdate(Comment(id: comment.id, username: comment.username, content: comment.content, isLiked: !comment.isLiked))
            }) {
                Image(systemName: comment.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(comment.isLiked ? .red : .gray)
            }
            Text("\(comment.likes) Likes") // Display the number of likes
                            .font(.body)
                            .foregroundColor(.gray)
            if isEditing {
                Button("Save") {
                    isEditing = false
                    onUpdate(Comment(id: comment.id, username: comment.username, content: editedContent, isLiked: comment.isLiked))
                }
            } else {
                Button("Edit") {
                    isEditing = true
                }
            }
            Button(action: { onDelete(comment) }) {
                Image(systemName: "trash")
            }
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        let comment = Comment(id: UUID(), username: "john_doe", content: "This is a comment", isLiked: false)
        return CommentView(comment: comment, onUpdate: { _ in }, onDelete: { _ in })
    }
}

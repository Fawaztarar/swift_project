//
//  PostDetailView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 16/02/2024.
//

import Foundation
import SwiftUI

struct PostDetailView: View {
    @State var post: Post
    @State private var newCommentText: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(post.username)
                    .font(.headline)
                Text(post.content)
                    .font(.body)

                Text(post.createdAt, formatter: postDateFormatter)
                    .font(.caption)
                    .foregroundColor(.gray)

                Divider()

                Text("Comments")
                    .font(.headline)

                ForEach(post.comments) { comment in
                    CommentView(comment: comment)
                }

                HStack {
                    TextField("Add a comment...", text: $newCommentText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Post") {
                        // Assuming CommentManager's addComment function is updated
                        addComment()
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func addComment() {
        let comment = Comment(username: "currentUsername", content: newCommentText) // Replace with actual user data
        post.comments.append(comment)
        newCommentText = ""  // Reset the input field
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostDetailView(post: Post.example1)
        }
    }
}

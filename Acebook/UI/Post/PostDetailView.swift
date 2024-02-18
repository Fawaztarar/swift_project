//
//  PostDetailView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 16/02/2024.
//

import SwiftUI

struct PostDetailView: View {
    @Binding var post: Post
    var viewModel: PostViewModel
    @State private var newCommentText: String = ""
    @State private var draftUsername: String = ""
    @State private var draftContent: String = ""
    @State private var showDeleteConfirmation: Bool = false
    @State private var isLiked: Bool = false

    init(post: Binding<Post>, viewModel: PostViewModel) {
        self._post = post
        self.viewModel = viewModel
        _draftUsername = State(initialValue: post.wrappedValue.username)
        _draftContent = State(initialValue: post.wrappedValue.content)
        _isLiked = State(initialValue: post.wrappedValue.isLiked)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                TextField("Username", text: $draftUsername)
                    .font(.headline)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Content", text: $draftContent)
                    .font(.body)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text(post.createdAt, formatter: postDateFormatter)
                    .font(.caption)
                    .foregroundColor(.gray)

                Divider()

                HStack {
                    Button(action: {
                        post.isLiked.toggle()
                        if post.isLiked {
                            post.likes += 1
                        } else {
                            post.likes -= 1
                        }
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : .gray)
                    }
                    Text("\(post.likes) Likes")
                        .font(.body)
                        .foregroundColor(.gray)
                }

                Text("Comments")
                    .font(.headline)

                ForEach(post.comments.indices, id: \.self) { index in
                    CommentView(comment: post.comments[index],
                                onUpdate: { updatedComment in
                                    updateComment(post: &post, updatedComment: updatedComment)
                                },
                                onDelete: { commentToDelete in
                                    deleteComment(post: &post, commentToDelete: commentToDelete)
                                })
                }

                HStack {
                    TextField("Add a comment...", text: $newCommentText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Post") {
                        addComment(post: &post, newCommentText: newCommentText, draftUsername: draftUsername)
                        // Reset text fields after adding comment
                        newCommentText = ""
                        draftUsername = ""
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing: HStack {
                Button("Save") {
                    post.username = draftUsername
                    post.content = draftContent
                    // Save changes
                }
                Button("Delete") {
                    showDeleteConfirmation = true
                }
            }
        )
        .alert(isPresented: $showDeleteConfirmation) {
            Alert(
                title: Text("Confirm Delete"),
                message: Text("Are you sure you want to delete this post?"),
                primaryButton: .destructive(Text("Delete")) {
                    if let index = viewModel.posts.firstIndex(where: { $0.id == post.id }) {
                        viewModel.deletePost(indexSet: IndexSet(integer: index))
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }
}


struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PostViewModel()
        NavigationView {
            PostDetailView(post: .constant(Post.example6), viewModel: viewModel)
        }
    }
}

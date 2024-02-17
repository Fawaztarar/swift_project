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

    // Inject the functions from the separate file
       let addComment: () -> Void
       let updateComment: (Comment) -> Void
       let deleteComment: (Comment) -> Void

       init(post: Binding<Post>, viewModel: PostViewModel, addComment: @escaping () -> Void, updateComment: @escaping (Comment) -> Void, deleteComment: @escaping (Comment) -> Void) {
           self._post = post
           self.viewModel = viewModel
           _draftUsername = State(initialValue: post.wrappedValue.username)
           _draftContent = State(initialValue: post.wrappedValue.content)
           _isLiked = State(initialValue: post.wrappedValue.isLiked)
           self.addComment = addComment
           self.updateComment = updateComment
           self.deleteComment = deleteComment
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
                        isLiked.toggle()
                        post.isLiked = isLiked
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

                ForEach(post.comments) { comment in
                    CommentView(comment: comment,
                                onUpdate: updateComment, onDelete: deleteComment)
                }

                HStack {
                    TextField("Add a comment...", text: $newCommentText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Post") {
                        addComment()
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
            PostDetailView(post: .constant(Post.example1), viewModel: viewModel, addComment: {}, updateComment: {_ in}, deleteComment: {_ in})
        }
    }
}

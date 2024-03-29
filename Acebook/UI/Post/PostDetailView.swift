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
    @State private var isLiked: Bool = false
    @State private var likeCount: Int = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(post.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 5) {
                        Text(post.username)
                            .font(.headline)
                        Text(post.content)
                            .font(.body)
                    }
                }
                .padding()
                Divider()
                HStack {
                    Button(action: {
                        isLiked.toggle()
                        if isLiked {
                            likeCount += 1
                        } else {
                            likeCount -= 1
                        }
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : .gray)
                    }
                    Text("Likes: \(likeCount)")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                Text("Comments")
                    .font(.headline)
                    .padding(.horizontal)
               
                
                
                
                HStack {
                    TextField("Add a comment...", text: $newCommentText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: postComment) {
                        Text("Post")
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func postComment() {
        guard !newCommentText.isEmpty else { return }
        let commentManager = CommentManager()
        let newComment = Comment(id: UUID(), username: "YourUsername", content: newCommentText)
        commentManager.addComment(to: &post, newComment: newComment) // Use the binding to update post
        newCommentText = "" // Clear the text field after posting
    }
}






struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PostViewModel()
        
        // Manually create an example post with comments for preview
        var examplePost = Post(id: UUID(),
                               username: "John Doe",
                               content: "This is a sample post",
                               createdAt: Date(),
                               profilePicture: "profile4.png")
        
        // Manually add comments to the example post
        let comment1 = Comment(id: UUID(), username: "User1", content: "Great post!")
        let comment2 = Comment(id: UUID(), username: "User2", content: "Keep up the good work!")
        examplePost.comments.append(comment1)
        examplePost.comments.append(comment2)
        
        // Add a new comment
        let newComment = Comment(id: UUID(), username: "NewUser", content: "This is a new comment!")
        examplePost.comments.append(newComment)
        
        return NavigationView {
            PostDetailView(post: .constant(examplePost), viewModel: viewModel)
        }
    }
}

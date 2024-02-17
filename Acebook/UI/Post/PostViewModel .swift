//
//  PostViewModel .swift
//  Acebook
//
//  Created by Fawaz Tarar on 17/02/2024.
//

import Foundation
import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    
    func loadPosts() {
            // Your logic to load posts, possibly from a backend
        }

    // Add a new post
    func addPost(username: String,content: String, createdAt: Date = Date()) {
        let newPost = Post( username: username, content: content, createdAt: createdAt)
        posts.append(newPost)        // Include backend logic here if necessary
    }

    // Edit an existing post
    func editPost(post: Post, newTitle: String, newContent: String) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            
            posts[index].content = newContent
            // Include backend logic here if necessary
        }
    }

    // Delete a post
    func deletePost(indexSet: IndexSet) {
        posts.remove(atOffsets: indexSet)
        // Include backend logic here if necessary
    }
}

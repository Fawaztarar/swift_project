//
//  PostCardView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 18/02/2024.
//

import Foundation
import SwiftUI

struct PostCardView: View {
    let post: Post
    let viewModel: PostViewModel
    
    init(post: Post, viewModel: PostViewModel) {
        self.post = post
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Image(post.profilePicture) // Assuming the profile picture is stored as an image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 10) {
                Text(post.username)
                    .font(.headline)
                
                Text(post.content)
                    .font(.body)
                
                Text(post.createdAt, formatter: postDateFormatter)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.horizontal)
        }
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an example post for preview
        let examplePost = Post(username: "John Doe", content: "This is a sample post", createdAt: Date(), profilePicture: "profile4.png")
        
        // Create a mock viewModel for preview
        let viewModel = PostViewModel()
        
        return PostCardView(post: examplePost, viewModel: viewModel)
            .previewLayout(.fixed(width: 300, height: 200))
            .padding()
            .previewDisplayName("Post Card Preview")
    }
}

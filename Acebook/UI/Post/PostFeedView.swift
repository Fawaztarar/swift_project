//
//  PostFeedView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import SwiftUI

struct PostFeedView: View {
    @State private var posts: [Post] = [
        Post.example1,
        Post.example2,
        Post.example3,
        Post.example4,
        Post.example5,
        Post.example6
    ]

    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: PostDetailView(post: post)) {
                    VStack(alignment: .leading) {
                        Text(post.username)
                            .font(.headline)
                        Text(post.content)
                            .font(.body)
                    }
                }
            }
            .navigationTitle("Feed")
        }
    }
}

struct PostFeedView_Previews: PreviewProvider {
    static var previews: some View {
        PostFeedView()
    }
}

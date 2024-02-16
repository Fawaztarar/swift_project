//
//  PostFeedView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import SwiftUI

struct PostFeedView: View {
    @State private var posts: [Post] = [Post.example1, Post.example2]

    var body: some View {
        List(posts) { post in
            VStack(alignment: .leading) {
                Text(post.username) // Corrected to use 'username'
                    .font(.headline)
                Text(post.content)
                    .font(.body)
            }
        }
        .navigationTitle("Feed")
    }
}

struct PostFeedView_Previews: PreviewProvider {
    static var previews: some View {
        PostFeedView()
    }
}

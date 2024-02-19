//
//  PostFeedView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import SwiftUI

struct PostFeedView: View {
    @StateObject var viewModel = PostViewModel()
    @State private var staticPosts: [Post] = [
        Post.example1,
        Post.example2,
        Post.example3,
        Post.example4,
        Post.example5,
        Post.example6
    ]
    @State private var useStaticData = true
    @State private var newPostText: String = ""

    var body: some View {
        NavigationView {
            List {
                if useStaticData {
                    ForEach(staticPosts.indices, id: \.self) { index in
                        NavigationLink(destination: PostDetailView(post: $staticPosts[index], viewModel: viewModel)) {
                            PostCardView(post: staticPosts[index], viewModel: viewModel)
                        }
                    }
                } else {
                    ForEach(viewModel.posts.indices, id: \.self) { index in
                        NavigationLink(destination: PostDetailView(post: $viewModel.posts[index], viewModel: viewModel)) {
                            PostCardView(post: viewModel.posts[index], viewModel: viewModel)
                        }
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarItems(
                leading: Button("Toggle Data Source") {
                    useStaticData.toggle()
                },
                trailing: Button(action: addNewPost) {
                    Image(systemName: "plus")
                }
            )
            .onAppear {
                if !useStaticData {
                    viewModel.loadPosts()
                }
            }
            .padding()
            .overlay(
                VStack {
                    TextField("What's on your mind?", text: $newPostText) // Step 2: Add text field for new post
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    
                }
                    
            )
        }
    }
                            
                            

    func addNewPost() {
        if useStaticData {
            // Provide an actual profile picture value (e.g., a URL or filename)
            let newPost = Post(username: "NewUser", content: "New Content", createdAt: Date(), profilePicture: "default_profile_picture")
            staticPosts.append(newPost)
        } else {
            viewModel.addPost(username: "NewUser", content: "New Content", createdAt: Date())
        }
    }

    func deletePost(at offsets: IndexSet) {
        if useStaticData {
            staticPosts.remove(atOffsets: offsets)
        } else {
            viewModel.deletePost(indexSet: offsets)
        }
    }
}

struct PostFeedView_Previews: PreviewProvider {
    static var previews: some View {
        PostFeedView()
    }
}

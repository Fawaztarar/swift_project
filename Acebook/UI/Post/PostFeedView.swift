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

    var body: some View {
        NavigationView {
            List {
                if useStaticData {
                    ForEach(staticPosts.indices, id: \.self) { index in
                        NavigationLink(destination: PostDetailView(post: $staticPosts[index], viewModel: viewModel)) {
                            // Your content here for staticPosts
                            Text(staticPosts[index].username)
                            // Your content here for staticPosts
                            Text(staticPosts[index].username)
                        }
                    }
                } else {
                    ForEach(viewModel.posts.indices, id: \.self) { index in
                        NavigationLink(destination: PostDetailView(post: $viewModel.posts[index], viewModel: viewModel)) {
                            VStack(alignment: .leading) {
                                Text(viewModel.posts[index].username).font(.headline)
                                Text(viewModel.posts[index].content).font(.body)
                            }
                        }
                    }
                    .onDelete(perform: deletePost)
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
        }
    }

    func addNewPost() {
        if useStaticData {
            let newPost = Post(username: "NewUser", content: "New Content", createdAt: Date())
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

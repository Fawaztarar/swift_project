//
//  postfeed.swift
//  Acebook
//
//  Created by Fawaz Tarar on 21/02/2024.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        VStack {
            // Search and Settings buttons
            HStack {
                Spacer()
                Button(action: {
                    // Settings action
                }) {
                    Image(systemName: "gearshape")
                        .foregroundColor(.white)
                }
                .padding()
                
                Button(action: {
                    // Search action
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                }
                .padding()
            }

            // Status update section
            StatusUpdateView2()

            // Facebook posts
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0..<5) { _ in
                        FacebookPostView2()
                    }
                }
            }
            .padding(.top, 10)
        }
        .background(Color.black) // Set background color to black
    }
}

struct StatusUpdateView2: View {
    @State private var statusText: String = ""

    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            TextField("What's on your mind?", text: $statusText)
                .padding(.leading, 10)
                .foregroundColor(.white) // Set placeholder text color to white


            Button(action: {
                // Implement the action to choose a photo
            }) {
                Image(systemName: "photo")
                    .padding(.trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal, 10)
    }
}

struct FacebookPostView2: View {
    var body: some View {
        VStack(spacing: 0) {
            // Profile and post header
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))

                VStack(alignment: .leading) {
                    Text("Tarar Fawaz")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("3 Jan")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                Button(action: {
                    // Ellipsis action
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                }
            }
            .padding()

            // Post content
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris hendrerit justo ac libero gravida, et suscipit felis ultrices.")
                .font(.body)
                .foregroundColor(.white)
                .padding([.leading, .trailing])

            // Post image
            Image("cover")
                .resizable()
                .scaledToFit()

            // Reaction and interaction buttons
            VStack {
                HStack {
                    Button(action: {
                        // Like action
                    }) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.blue)
                    }

                    Text("1.5k Likes")
                        .foregroundColor(.blue)

                    Button(action: {
                        // Comment action
                    }) {
                        Image(systemName: "bubble.left.fill")
                            .foregroundColor(.blue)
                    }

                    Text("500 Comments")
                        .foregroundColor(.blue)

                    Spacer()

                    Button(action: {
                        // Share action
                    }) {
                        Image(systemName: "arrowshape.turn.up.right.fill")
                            .foregroundColor(.blue)
                    }

                    Text("200 Shares")
                        .foregroundColor(.blue)
                }
                .padding()
            }
        }
        .background(Color.black) // Set background color to black
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

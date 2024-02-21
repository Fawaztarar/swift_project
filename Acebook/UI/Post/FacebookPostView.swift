//
//  FacebookPostView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 19/02/2024.
//

import Foundation


import SwiftUI

struct FacebookPostView: View {
    var body: some View {
        VStack(spacing: 0) {  // Set spacing to 0 to remove gaps
            // Profile and post header
            HStack {
                Image("profile4.png") // Replace with your profile picture asset
                    .resizable()
                    .scaledToFill()
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

                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
            }
            .padding()

            // Post content
            Text("\"شيري اور فوجي کا موٹرسائیکل پر بیمشق\"")
                .font(.body)
                .foregroundColor(.white)
                .padding([.leading, .trailing])

            // Post image
            Image("Image") // Replace with your post image asset
                .resizable()
                .scaledToFit()

            // Reaction and interaction buttons
            VStack {
                HStack {
                    Button(action: {
                        // Like action
                    }) {
                        Image(systemName: "hand.thumbsup.fill") // SF Symbol for like
                            .foregroundColor(.white)
//                        Text("Like")
//                            .foregroundColor(.white)
                    }

//                    Spacer()

                    Text("K Smith and 2 others")
                        .foregroundColor(.white)

//                    Spacer()

                    Button(action: {
                        // Share action
                    }) {
                        Text("1 share")
                            .foregroundColor(.white)
                    }
                }
                .padding()

                HStack {
                    Button(action: {
                        // Like action
                    }) {
                        HStack {
                            Image(systemName: "hand.thumbsup") // SF Symbol for thumbs up
                            Text("Like")
                        }
                        .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)

                    Button(action: {
                        // Comment action
                    }) {
                        HStack {
                            Image(systemName: "message") // SF Symbol for comment
                            Text("Comment")
                        }
                        .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)

                    Button(action: {
                        // Share action
                    }) {
                        HStack {
                            Image(systemName: "arrowshape.turn.up.right") // SF Symbol for share
                            Text("Share")
                        }
                        .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
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

struct FacebookPostView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookPostView()
            .preferredColorScheme(.dark) // To better visualize the white text on black background in the preview
    }
}

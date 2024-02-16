//
//  UserProfileView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import SwiftUI

struct UserProfileView: View {
    let user: User // Use `let` since the user data won't change within this view

    var body: some View {
        VStack(spacing: 10) {
            // Display the profile picture if available
            if let profilePictureURL = user.profilePictureURL {
                AsyncImage(url: profilePictureURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
            } else {
                // Placeholder for when there's no profile picture
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
            }

            Text(user.username)
                .font(.title)
                .padding(.bottom, 1)

            // Show the bio if available
            if let bio = user.bio {
                Text(bio)
                    .font(.body)
                    .padding(.bottom, 1)
            }

            // Display the email
            Text(user.email)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .navigationTitle("\(user.username)'s Profile")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserProfileView(user: User.example)
        }
    }
}

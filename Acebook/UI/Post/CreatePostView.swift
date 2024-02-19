//
//  CreatePostView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 18/02/2024.
//

import Foundation
import SwiftUI

struct CreatePostView: View {
    @State private var postText: String = ""
    
    var body: some View {
        VStack {
            // Top bar including the 'X' close button, 'Create post' title, and 'Next' button
            createPostTopBar()
            
            // User profile and post privacy settings
            userProfileAndSettings()
            
            // Text editor for the post content
            postContentEditor()
            
            // Divider to separate text editor from post options
            Divider()
            
            // Post options like adding a photo/video, tagging people, etc.
            postOptions()
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func createPostTopBar() -> some View {
        HStack {
            Button(action: {
                // Close action
            }) {
                Image(systemName: "xmark")
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text("Create post")
                .bold()
            
            Spacer()
            
            Button(action: {
                // Next action
            }) {
                Text("Next")
                    .bold()
            }
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
    }
    
    @ViewBuilder
    private func userProfileAndSettings() -> some View {
        HStack {
            Image("profile4.png") // Replace with your profile image asset
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text("Fawaz Tarar") // Replace with dynamic user name
                .fontWeight(.semibold)
            
            Spacer()
            
            HStack(spacing: 5) {
                Label("Public", systemImage: "globe")
                Label("Album", systemImage: "photo.on.rectangle")
                Image(systemName: "location.slash.fill")
            }
            .padding(.trailing, 10)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func postContentEditor() -> some View {
        TextEditor(text: $postText)
            .placeholder(postText.isEmpty) {
                Text("What's on your mind?").foregroundColor(.gray).padding(.all, 8)
            }
            .frame(minHeight: 150)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private func postOptions() -> some View {
        VStack(spacing: 15) {
            OptionButton(iconName: "camera", optionName: "Photo/video")
            OptionButton(iconName: "person.crop.circle.badge.plus", optionName: "Tag people")
            OptionButton(iconName: "smiley", optionName: "Feeling/activity")
            OptionButton(iconName: "mappin", optionName: "Check in")
            OptionButton(iconName: "video.circle.fill", optionName: "Live video")
            OptionButton(iconName: "paintpalette", optionName: "Background color")
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func OptionButton(iconName: String, optionName: String) -> some View {
        Button(action: {
            // Implement action for each button
        }) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.green) // Color can be adjusted as needed
                    .imageScale(.large)
                Text(optionName)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.vertical, 10)
            .background(Color.black.opacity(0.8))
            .cornerRadius(10)
        }
    }
}

// Extension to add placeholder functionality to TextEditor
extension View {
    @ViewBuilder
    func placeholder<Content: View>(
        _ show: Bool,
        alignment: Alignment = .topLeading,
        @ViewBuilder _ content: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if show {
                content()
            }
            self
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}

//
//  StatusUpdateView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 19/02/2024.
//

import Foundation
import SwiftUI

struct StatusUpdateView: View {
    @State private var statusText: String = ""
    
    var body: some View {
        HStack {
            Image("profile4.png") // Replace "profile_pic" with your profile picture asset name
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            TextField("What's on your mind?", text: $statusText)
                .padding(.leading, 10)
            
            Button(action: {
                // Implement the action to choose a photo
            }) {
                Image(systemName: "photo") // For a custom image replace with Image("your_custom_photo_icon")
                    .padding(.trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.2)) // You can adjust the opacity as needed
        .cornerRadius(20)
        .padding(.horizontal, 10)
    }
}

struct StatusUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        StatusUpdateView()
    }
}

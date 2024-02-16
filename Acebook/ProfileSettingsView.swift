//
//  ProfileSettingsView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import Foundation
import SwiftUI

struct ProfileSettingsView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var bio: String = ""
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
            TextField("Email", text: $email)
            Section(header: Text("About")) {
                            TextEditor(text: $bio)
                                .frame(height: 100) // Set a fixed height for the TextEditor
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .padding(.top, 5)
                        }
            Button("Save Changes") {
                // Handle save logic
            }
        }
        .navigationTitle("Profile Settings")
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}

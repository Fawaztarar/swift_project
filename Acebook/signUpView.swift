//
//  signUp.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Sign Up") {
                // Handle sign up logic
            }
        }
        .navigationTitle("Sign Up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

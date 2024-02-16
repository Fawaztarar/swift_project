//
//  LoginView.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccessful = true  // Assuming login is successful by default
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Log In") {
                loginAction()
            }
            if !isLoginSuccessful {
                Text("Login failed. Please check your credentials.")
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Log In")
    }
    
    func loginAction() {
        NetworkManager.shared.login(email: email, password: password) { success in
            DispatchQueue.main.async {
                self.isLoginSuccessful = success
                if success {
                    // Navigate to the next screen or update the UI accordingly
                } else {
                    // Show error message or handle login failure
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

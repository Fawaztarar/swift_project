//
//  NetworkManager.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://localhost:3000") else { return }
        
        let loginDetails = ["email": email, "password": password]
        guard let jsonData = try? JSONEncoder().encode(loginDetails) else { return }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid email or password")
                completion(false)
                return
            }
            
            // Handle successful login here
            completion(true)
            
        }.resume()
    }
}

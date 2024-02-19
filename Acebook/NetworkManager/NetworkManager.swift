//
//  NetworkManager.swift
//  Acebook
//
//  Created by Fawaz Tarar on 15/02/2024.
//

//import Foundation
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    
//    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
//        guard let url = URL(string: "http://localhost:3000") else { return }
//        
//        let loginDetails = ["email": email, "password": password]
//        guard let jsonData = try? JSONEncoder().encode(loginDetails) else { return }
//        
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = jsonData
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Login error: \(error.localizedDescription)")
//                completion(false)
//                return
//            }
//            
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                print("Invalid email or password")
//                completion(false)
//                return
//            }
//            
//            // Handle successful login here
//            completion(true)
//            
//        }.resume()
//    }
//}

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "http://127.0.0.1:8080" // Your backend base URL
    
    enum HTTPMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    func request(endpoint: String, method: HTTPMethod, body: Data? = nil, completion: @escaping (Result<Data?, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(endpoint)") else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                completion(.failure(NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}

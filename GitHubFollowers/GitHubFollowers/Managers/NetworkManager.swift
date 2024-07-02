//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Deren Bozer on 7/1/24.
//

import Foundation

/// Creates the Singleton
class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    
    /// GET
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        
        
        /// URL
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        
        /// Checks if it's a valid URL
        /// Creates a URL object if valid
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        
        /// Network Call setup
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            /// Checks if the error exists
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            
            /// Checks if response is not NIL, checks if the status code is 200
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            
            /// Checks if the data is bad
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            /// Takes the JSON data from the server, creates into object
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        
        /// Starts the network call
        task.resume()
    }
}

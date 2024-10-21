//
//  NetworkManager.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    

    func fetchImages(endpoint: String, query: String) async throws -> [ImageModel] {
        var urlString: String
        
       
        if query.isEmpty {
            urlString = "https://api.unsplash.com/photos/random?client_id=z5C-IprPLpQCwevYJm6rqhHo-6XWXjFNtg1ILDbx3Fc&count=10"
        } else {
            urlString = "https://api.unsplash.com/search/photos?client_id=z5C-IprPLpQCwevYJm6rqhHo-6XWXjFNtg1ILDbx3Fc&query=\(query)"
        }
        
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        
       
        let (data, _) = try await URLSession.shared.data(from: url)
        
      
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON Response: \(jsonString)")
        }
        
        
        if query.isEmpty {
          
            return try JSONDecoder().decode([ImageModel].self, from: data)
        } else {
            
            let searchResponse = try JSONDecoder().decode(ImageSearchResponse.self, from: data)
            return searchResponse.results
        }
    }
}

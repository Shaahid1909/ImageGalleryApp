//
//  NetworkManager.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    // Asynchronous function to fetch images
    func fetchImages(endpoint: String, query: String) async throws -> [ImageModel] {
        var urlString: String
        
        // Check if there is a query to decide the endpoint
        if query.isEmpty {
            urlString = "https://api.unsplash.com/photos/random?client_id=z5C-IprPLpQCwevYJm6rqhHo-6XWXjFNtg1ILDbx3Fc&count=10"
        } else {
            urlString = "https://api.unsplash.com/search/photos?client_id=z5C-IprPLpQCwevYJm6rqhHo-6XWXjFNtg1ILDbx3Fc&query=\(query)"
        }
        
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        
        // Fetch data using async/await
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Print the raw JSON response for debugging
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON Response: \(jsonString)")
        }
        
        // Decode the data based on whether there is a query or not
        if query.isEmpty {
            // Expecting an array of images directly for random photos
            return try JSONDecoder().decode([ImageModel].self, from: data)
        } else {
            // Expecting a dictionary with "results" key for search photos
            let searchResponse = try JSONDecoder().decode(ImageSearchResponse.self, from: data)
            return searchResponse.results
        }
    }
}

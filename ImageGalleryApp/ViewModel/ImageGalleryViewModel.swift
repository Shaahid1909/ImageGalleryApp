//
//  ImageGalleryViewModel.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//

import Foundation

class ImageGalleryViewModel {
    private var images: [ImageModel] = []
    var onImagesFetched: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func fetchImages(query: String = "") {
        Task {
            let endpoint = query.isEmpty ? "photos" : "search/photos"
            do {
                let fetchedImages = try await NetworkManager.shared.fetchImages(endpoint: endpoint, query: query)
                self.images = fetchedImages
                self.onImagesFetched?()
            } catch {
                self.onError?(error.localizedDescription)
            }
        }
    }
    
    func numberOfItems() -> Int {
        return images.count
    }
    
    func image(at index: Int) -> ImageModel {
        return images[index]
    }
}


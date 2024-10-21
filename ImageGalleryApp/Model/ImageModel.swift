//
//  ImageModel.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//

import Foundation

struct ImageSearchResponse: Codable {
    let results: [ImageModel]
}

struct ImageModel: Codable {
    let id: String
    let alt_description: String?
    let urls: ImageURLs
    let user: ImageUser
}

struct ImageURLs: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

struct ImageUser: Codable {
    let id: String
    let username: String
    let name: String
    let profile_image: UserProfileImage
}

struct UserProfileImage: Codable {
    let small: String
    let medium: String
    let large: String
}

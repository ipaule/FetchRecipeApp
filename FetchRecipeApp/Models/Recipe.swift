//
//  Recipe.swift
//  FetchRecipeApp
//
//  Created by Paul on 4/14/25.
//

import Foundation


struct Recipe: Decodable, Identifiable {
    let cuisine: String
    let name: String
    let photoUrlLarge: URL?
    let photoUrlSmall: URL?
    let sourceUrl: URL?
    let id : UUID
    let youtubeUrl:URL?
    
    enum CodingKeys: String, CodingKey {
        case cuisine = "cuisine"
        case name = "name"
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case id = "uuid"
        case youtubeUrl = "youtube_url"
    }
    
}

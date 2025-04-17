//
//  ImageLoader.swift
//  FetchRecipeApp
//
//  Created by Paul on 4/16/25.
//

import UIKit

final class ImageLoader {
    private let cache = ImageCache.shared

    func loadImage(from url: URL) async throws -> UIImage {
        //if in cache
        if let cached = cache.image(for: url) {
            return cached
        }
        
        //if new image
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw URLError(.cannotDecodeContentData)
        }

        cache.store(image: image, for: url)
        return image
    }
}

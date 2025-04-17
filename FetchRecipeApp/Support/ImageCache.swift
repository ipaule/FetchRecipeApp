//
//  ImageCache.swift
//  FetchRecipeApp
//
//  Created by Paul on 4/16/25.
//
import UIKit

final class ImageCache {
    static let shared = ImageCache()
    private let cacheDir: URL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]

    func image(for url: URL) -> UIImage? {
        let filename = "\(url.absoluteString.hashValue).jpg"
        let fileURL = cacheDir.appendingPathComponent(filename)

        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        return UIImage(data: data)
    }

    func store(image: UIImage, for url: URL) {
        let filename = "\(url.absoluteString.hashValue).jpg"
        let fileURL = cacheDir.appendingPathComponent(filename)

        if let data = image.jpegData(compressionQuality: 1.0) {
            try? data.write(to: fileURL)
        }
    }
}

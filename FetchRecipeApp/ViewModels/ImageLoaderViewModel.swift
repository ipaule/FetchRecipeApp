//
//  ImageLoaderViewModel.swift
//  FetchRecipeApp
//
//  Created by Paul on 4/16/25.
//

import Foundation
import UIKit

@MainActor
final class ImageLoaderViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    private let loader = ImageLoader()

    func load(from url: URL?) async {
        guard let url else { return }
        do {
            image = try await loader.loadImage(from: url)
        } catch {
            image = nil
        }
    }
}

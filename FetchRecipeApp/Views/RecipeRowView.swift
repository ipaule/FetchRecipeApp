//
//  RecipeRowView.swift
//  FetchRecipeApp
//
//  Created by Paul on 4/16/25.
//
import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe
    @StateObject private var loader = ImageLoaderViewModel()

    var body: some View {
        HStack {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            VStack(alignment: .leading) {
                Text(recipe.name).font(.headline)
                Text(recipe.cuisine).font(.subheadline).foregroundColor(.secondary)
            }
        }
        .task {
            await loader.load(from: recipe.photoUrlSmall)
        }
    }
}

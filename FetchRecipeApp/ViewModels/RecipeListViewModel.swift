//
//  RecipeListViewModel.swift
//  FetchRecipeApp
//
//  Created by Paul on 4/16/25.
//

import Foundation

@MainActor
final class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var error: String?

    private let service = RecipeService()

    func loadRecipes() async {
        isLoading = true
        error = nil
        do {
            //let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
            //let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!
            let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!
            recipes = try await service.fetchRecipes(from: url)
        } catch {
            self.error = "Failed to load recipes."
            recipes = []
        }
        isLoading = false
    }
}

//
//  RecipeService.swift
//  FetchRecipeApp
//
//  Created by Paul on 4/14/25.
//

import Foundation

final class RecipeService {
    func fetchRecipes(from url: URL) async throws -> [Recipe] {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let root = try JSONDecoder().decode([String: [Recipe]].self, from: data)
        
        //error
        guard let recipes = root["recipes"] else {
            throw URLError(.badServerResponse)
        }
        
        return recipes
    }
}

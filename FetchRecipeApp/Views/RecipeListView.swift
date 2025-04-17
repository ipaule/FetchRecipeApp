//
//  RecipeListView.swift
//  FetchRecipeApp
//
//  Created by Paul on 4/16/25.
//
import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.error {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.recipes) { recipe in
                        RecipeRowView(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
            .toolbar {
                Button("Refresh") {
                    Task { await viewModel.loadRecipes() }
                }
            }
        }
        .task {
            await viewModel.loadRecipes()
        }
    }
}

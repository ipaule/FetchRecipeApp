//
//  FetchRecipeAppTests.swift
//  FetchRecipeAppTests
//
//  Created by Paul on 4/14/25.
//

import XCTest
@testable import FetchRecipeApp

final class RecipeServiceTests: XCTestCase {
    let service = RecipeService()

    func test_validRecipesLoadSuccessfully() async throws {
        let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
        do {
            let recipes = try await service.fetchRecipes(from: url)
            XCTAssertFalse(recipes.isEmpty, "Expected recipes, got none.")
        } catch {
            XCTFail("Expected valid recipes, but got error: \(error)")
        }
    }

    func test_malformedJSONThrowsError() async {
        let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!
        do {
            _ = try await service.fetchRecipes(from: url)
            XCTFail("Expected error for malformed JSON, but got success.")
        } catch {
            XCTAssertTrue(error is DecodingError || error is URLError, "Expected decoding error, got: \(error)")
        }
    }

    func test_emptyRecipesThrowsError() async {
        let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")!
        do {
            _ = try await service.fetchRecipes(from: url)
            XCTFail("Expected error for empty recipe list, but got success.")
        } catch {
            XCTAssertTrue(error is URLError, "Expected URLError, got: \(error)")
        }
    }
}

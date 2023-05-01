//
//  SelectedRecipe.swift
//  Recipes
//
//  Created by Brandon Kuhl on 4/29/23.
//

import Foundation
import SwiftUI

struct SelectedRecipe: Codable {
  var idMeal: String = "52892"
  var strMeal: String = "TestMeal"
  var strMealThumb: String = "TestThumb"
  var strInstructions: String = "TestInstructions"
  var strIngredient: [String]?
  /*
  func fetchIngredients(from url: URL) async throws -> [String] {
      enum CodingKeys: String, CodingKey {
        case strIngredient
          case idMeal
          case strMeal
          
      }
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      let recipe = try decoder.decode(SelectedRecipe.self, from: data)
      return recipe.ingredients.filter { !$0.isEmpty }
  }
   */
}

//
//  RecipeVM.swift
//  Recipes
//
//  Created by Brandon Kuhl on 4/29/23.
//

import Foundation

class RecipeVM: ObservableObject {
  @Published var recipes = [Recipe]()
  
  init() {
    guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
      print("Invalid URL")
      return
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data else { return }
      do {
        let decodedData = try JSONDecoder().decode([String: [Recipe]].self, from: data)
        DispatchQueue.main.async {
          self.recipes = decodedData["meals"] ?? []
        }
      } catch {
        print("Error decoding JSON: \(error)")
      }
    }.resume()
  }
}

/*
 enum CodingKeys: String, CodingKey {
 case ingredients = "strIngredient"
 }
 let (data, _) = try await URLSession.shared.data(from: url)
 let decoder = JSONDecoder()
 let recipe = try decoder.decode(SelectedRecipe.self, from: data)
 return recipe.ingredients.filter { !$0.isEmpty }
 */

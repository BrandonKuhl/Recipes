//
//  SelectedVM.swift
//  Recipes
//
//  Created by Brandon Kuhl on 4/29/23.
//

import Foundation

class SelectedVM: ObservableObject {
  @Published var recipe = [SelectedRecipe]()
  
  init(idMeal: String) {
    let address = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)"
    guard let url = URL(string: address) else {
      print("Invalid URL")
      return
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data else { return }
      do {
        let decodedData = try JSONDecoder().decode([String: [SelectedRecipe]].self, from: data)
        DispatchQueue.main.async {
          self.recipe = decodedData["meals"] ?? []
        }
      } catch {
        print("Error decoding JSON: \(error)")
      }
    }.resume()
  }
  func tester() {
    print(recipe[0].idMeal)
  }
}

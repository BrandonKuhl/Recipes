//
//  Recipe.swift
//  Recipes
//
//  Created by Brandon Kuhl on 4/29/23.
//

import Foundation

struct Recipe: Codable {
  let idMeal: String
  let strMeal: String
  let strMealThumb: String
  let ingredients: [String]?
  
  
}

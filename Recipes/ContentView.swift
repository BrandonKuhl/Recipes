//
//  ContentView.swift
//  Recipes
//
//  Created by Brandon Kuhl on 4/25/23.
//

import SwiftUI

var selectedRecipe = SelectedRecipe()

struct ContentView: View {
  @ObservedObject var viewModel = RecipeVM()
  @State private var showSelected = true
  @State private var selection: String?
  @ObservedObject var selectedVM = SelectedVM(idMeal: "52892")

  var body: some View {
    NavigationStack() {
      List(viewModel.recipes, id: \.idMeal) { recipe in
        NavigationLink {
          let selectedVM = SelectedVM(idMeal: recipe.idMeal)
          SelectedRecipeView(selectedVM: selectedVM)
        } label: {
          Text(recipe.strMeal)
            .font(.headline)
        }
        
        //(recipe.strMeal, value: recipe.idMeal)
//          Text(recipe.strMeal)
//            .font(.headline)
//                    .onTapGesture {
//                      //selectedViewModel.idMeal = recipe.idMeal
//                      showSelected.toggle()
//                    }.sheet(isPresented: self.$showSelected) {
//                      var selectedViewModel = SelectedVM(idMeal: selection!)
//                      SelectedRecipeView(selectVM: selectedViewModel)
//                    }
          /*
           RemoteImage(url: recipe.strMealThumb)
           .frame(width: 100, height: 100)
           */
      }
      .navigationTitle("Recipes")
    }

  }

}
struct SelectedRecipeView: View {
  //@Environment(\.dismiss) var dismiss
  let selectedVM: SelectedVM
  var body: some View {
    List(selectedVM.recipe, id: \.idMeal) { recipe in
      VStack(alignment: .leading) {
        Text(recipe.strMeal)
          .font(.title)
        Spacer()
        RemoteImage(url: recipe.strMealThumb)
        Spacer()
        Text(recipe.strInstructions)
          .font(.body)
          .lineSpacing(10)
        Spacer()
        //Text(recipe.strIngredient[0])
//        List(recipe.strIngredient ?? [], id: \.self) { ingredient in
//          Text(ingredient)
//            .font(.body)
//        }
      }
    }
  }
}



 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }
 

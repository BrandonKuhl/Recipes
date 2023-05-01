//
//  RemoteImage.swift
//  Recipes
//
//  Created by Brandon Kuhl on 4/29/23.
//

//import Foundation
import SwiftUI

struct RemoteImage: View {
  let url: String
  
  var body: some View {
    if let image = getImageFromUrl(url: url) {
      Image(uiImage: image)
        .resizable()
        .aspectRatio(contentMode: .fit)
    } else {
      Image(systemName: "photo")
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
  }
  
  func getImageFromUrl(url: String) -> UIImage? {
    guard let imageURL = URL(string: url),
          let imageData = try? Data(contentsOf: imageURL) else {
      return nil
    }
    return UIImage(data: imageData)
  }
  
}

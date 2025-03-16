//
//  MealDetailView.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @ObservedObject var viewModel: RecipeViewModel
    
    var meal: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: meal.thumbnail)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text("Ingredients")
                    .font(.headline)
                    .padding(.horizontal)
                ForEach(meal.ingredients, id: \.self) { ingredient in
                    Text("✅ \(ingredient)")
                        .padding(.horizontal)
                }
                
                Text("Instructions")
                    .font(.headline)
                    .padding(.horizontal)
                Text(meal.instructions)
                    .padding(.horizontal)
            }.padding()
        }
        .navigationTitle(meal.name)
        .toolbar {
            Image(systemName: viewModel.isFavorite(meal: meal) ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .onTapGesture {
                    viewModel.toggleFavorite(meal: meal)
                }
        }
        
    }
}

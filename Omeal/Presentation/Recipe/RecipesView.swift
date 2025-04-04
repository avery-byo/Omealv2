//
//  RecipesView.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import SwiftUI
import SwiftData

struct RecipesView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel: RecipeViewModel
    @State private var showFavorites = false
    
    init(repository: RecipeRepository) {
        _viewModel = StateObject(wrappedValue: RecipeViewModel(repository: repository))
    }
    
    var filteredMeals: [Recipe] {
        showFavorites ? viewModel.meals.filter { viewModel.isFavorite(meal: $0) } : viewModel.meals
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("View", selection: $showFavorites) {
                    Text("All").tag(false)
                    Text("Favorites").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List(filteredMeals) { meal in
                    NavigationLink {
                        RecipeDetailView(viewModel: viewModel, meal: meal)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: meal.thumbnail)) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            
                            Text(meal.name)
                            Spacer()
                            Image(systemName: viewModel.isFavorite(meal: meal) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .onTapGesture {
                                    viewModel.toggleFavorite(meal: meal)
                                }
                            
                        }
                    }
                }
                .navigationTitle("Recipes")
            }
        }
        .onAppear {
            viewModel.setContext(context)
        }
    }
}


#Preview {
    RecipesView(repository: MealRepositoryImpl())
}


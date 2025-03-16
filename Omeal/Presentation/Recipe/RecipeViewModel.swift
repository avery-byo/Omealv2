//
//  MealViewModel.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import Foundation
import Combine
import SwiftData

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var meals: [Recipe] = []
    @Published var favorites: [FavoriteMeal] = []

    private var repository: MealRepository
    private var cancellables: Set<AnyCancellable> = []
    var context: ModelContext? 

    init(repository: MealRepository) {
        self.repository = repository
        fetchMeals()
    }

    func setContext(_ context: ModelContext) {
        self.context = context
        loadFavorites()
    }

    func fetchMeals() {
        repository.fetchMeals()
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] meals in
                self?.meals = meals
            })
            .store(in: &cancellables)
    }

    func loadFavorites() {
        guard let context else { return }
        do {
            let fetchRequest = FetchDescriptor<FavoriteMeal>()
            favorites = try context.fetch(fetchRequest)
        } catch {
            print("Failed to load favorites: \(error)")
        }
    }

    func toggleFavorite(meal: Recipe) {
        guard let context else { return }

        if let existing = favorites.first(where: { $0.id == meal.id }) {
            context.delete(existing)
        } else {
            let favorite = FavoriteMeal(id: meal.id, name: meal.name, thumbnail: meal.thumbnail)
            context.insert(favorite)
        }

        do {
            try context.save()
            loadFavorites()
        } catch {
            print("Failed to save context: \(error)")
        }
    }

    func isFavorite(meal: Recipe) -> Bool {
        favorites.contains { $0.id == meal.id }
    }
}

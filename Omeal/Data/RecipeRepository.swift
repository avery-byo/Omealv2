//
//  MealRepository.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import Foundation
import Combine

protocol RecipeRepository {
    func fetchRecipes() -> AnyPublisher<[Recipe], Error>
}

class MealRepositoryImpl: RecipeRepository {
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RecipesResponse.self, decoder: JSONDecoder())
            .map { $0.recipes }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

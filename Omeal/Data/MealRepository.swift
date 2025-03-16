//
//  MealRepository.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import Foundation
import Combine

protocol MealRepository {
    func fetchMeals() -> AnyPublisher<[Recipe], Error>
}

class MealRepositoryImpl: MealRepository {
    func fetchMeals() -> AnyPublisher<[Recipe], Error> {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealsResponse.self, decoder: JSONDecoder())
            .map { $0.meals }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

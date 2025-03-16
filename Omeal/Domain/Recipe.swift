//
//  Meal.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    let id: String
    let name: String
    let thumbnail: String
    let instructions: String
    let ingredients: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case instructions = "strInstructions"
    }
    
    init(id: String, name: String, thumbnail: String, instructions: String, ingredients: [String] = []) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.instructions = instructions
        self.ingredients = ingredients
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        instructions = try container.decode(String.self, forKey: .instructions)
        
        var ingredientsList: [String] = []
        let additionalKeys = (1...20).map { "strIngredient\($0)" }
        let decoderContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        for key in additionalKeys {
            if let ingredient = try decoderContainer.decodeIfPresent(String.self, forKey: DynamicCodingKeys(stringValue: key)!), !ingredient.isEmpty {
                ingredientsList.append(ingredient)
            }
        }
        ingredients = ingredientsList
    }
}

private struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    init?(stringValue: String) { self.stringValue = stringValue }
    var intValue: Int? { return nil }
    init?(intValue: Int) { return nil }
}

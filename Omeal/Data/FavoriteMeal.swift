//
//  FavoriteMeal.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 04/04/25.
//

import Foundation
import SwiftData

@Model
class FavoriteMeal: Identifiable {
    let id: String
    let name: String
    let thumbnail: String

    init(id: String, name: String, thumbnail: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
    }
}

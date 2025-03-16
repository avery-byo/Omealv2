//
//  OmealApp.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import SwiftUI

@main
struct OmealApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }.modelContainer(for: FavoriteMeal.self)
    }
    
}

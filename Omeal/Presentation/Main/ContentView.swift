//
//  ContentView.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RecipesView(repository: MealRepositoryImpl())
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}

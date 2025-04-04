# 🍳 Food Recipes App

This iOS application fetches food recipes from [TheMealDB API](https://www.themealdb.com/api.php) and allows users to view, favorite, and explore detailed cooking instructions. The project is structured using **Clean Architecture**, incorporates **Dependency Injection**, and leverages **Reactive Programming** with SwiftUI and Combine. 


# Lofi Design
<img width="786" alt="lofi" src="https://github.com/user-attachments/assets/83e06880-9a33-479a-b99b-a40a75e9f151" />

---

## 🏢 Architecture Overview: Clean Architecture

The project separates concerns into three main layers:

### 1. Presentation Layer
- Displays the UI and handles user interaction.
- Files:
  - `RecipesView.swift` — List and navigation UI
  - `RecipeDetailView.swift`, `RecipeDetailView.swift` — Recipe detail UI
  - `ProfileView.swift` — User profile info
  - `RecipeViewModel.swift`, `RecipeViewModel.swift` — State management and logic

### 2. Domain Layer
- Core business logic and entities.
- Files:
  - `Recipe.swift`

### 3. Data Layer
- API communication and persistence.
- Files:
  - `RecipeRepository.swift`, `MealRepositoryImpl.swift`
  - `RecipesResponse.swift`
  - `FavoriteMeal.swift` (SwiftData model)

---

## ⚙️ Dependency Injection

### What it does:
- Makes components modular and testable by injecting dependencies like repositories.

### Where it's used:
```swift
// RecipesView.swift
init(repository: RecipeRepository) {
    _viewModel = StateObject(wrappedValue: RecipeViewModel(repository: repository))
}

// RecipeViewModel.swift
init(repository: RecipeRepository) {
    self.repository = repository
    fetchRecipes()
}


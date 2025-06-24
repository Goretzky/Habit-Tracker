//
//  HabitsViewModel.swift
//  Habit Tracker
//
//  Created by Kern Goretzky on 2025-05-25.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            saveItems()
        }
    }

    init() {
        loadItems()
    }

    private func saveItems() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Habits")
        }
    }

    private func loadItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                self.items = decodedItems
                return
            }
        }

        self.items = []
    }
}

//
//  Habit.swift
//  Habit Tracker
//
//  Created by Kern Goretzky on 2025-05-25.
//


import Foundation

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var count: Int
}

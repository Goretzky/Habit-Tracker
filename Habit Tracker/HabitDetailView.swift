//
//  HabitDetailView.swift
//  Habit Tracker
//
//  Created by Kern Goretzky on 2025-05-25.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    @ObservedObject var habits: Habits

    var habitIndex: Int? {
        habits.items.firstIndex { $0.id == habit.id }
    }

    var body: some View {
        Form {
            Section(header: Text("Description")) {
                Text(habit.description)
            }

            Section(header: Text("Completed")) {
                Text("\(habit.count) times")
                    .font(.largeTitle)
                    .bold()
            }

            if let index = habitIndex {
                Button("Mark as Completed") {
                    habits.items[index].count += 1
                }
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                Text("Habit not found.")
                    .foregroundColor(.red)
            }
        }
        .navigationTitle(habit.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//
//  AddHabitView.swift
//  Habit Tracker
//
//  Created by Kern Goretzky on 2025-05-25.
//
import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits

    @State private var name = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Habit Name")) {
                    TextField("e.g. Drink Water", text: $name)
                }

                Section(header: Text("Description")) {
                    TextField("Why are you doing this?", text: $description)
                }
            }
            .navigationTitle("Add Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newHabit = Habit(name: name, description: description, count: 0)
                        habits.items.append(newHabit)
                        dismiss()
                    }
                    .disabled(name.isEmpty || description.isEmpty)
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}


//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Kern Goretzky on 2025-05-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var habits = Habits()
    @State private var showingAddHabit = false

    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { habit in
                    NavigationLink(destination: HabitDetailView(habit: habit, habits: habits)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                    .font(.headline)
                                Text(habit.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Text("\(habit.count)")
                                .fontWeight(.bold)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: removeItems) // 👈 Delete support
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                // Edit button to enable deletion
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }

                // Add button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
    }

    // MARK: - Delete Habit
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

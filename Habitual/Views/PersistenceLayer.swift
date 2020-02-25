//
//  PersistenceLayer.swift
//  Habitual
//
//  Created by Henry Calderon on 2/23/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation

struct PersistenceLayer {

    // Step 1
    private(set) var habits: [Habit] = []

    // Step 2
    private static let userDefaultsHabitsKeyValue = "HABITS_ARRAY"

    init() {
        // Step 3
        self.loadHabits()
    }
    
    // Step 4
    private mutating func loadHabits(){
        // Step 5
        let userDefaults = UserDefaults.standard
        // Step6
        guard
            let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultsHabitsKeyValue),
            let habits = try? JSONDecoder().decode([Habit].self, from: habitData) else {
                return
        }
        self.habits = habits
        
    }
    
     // Step 7
    @discardableResult

       // Step 8
       mutating func createNewHabit(name: String, image: Habit.Images) -> Habit {

           let newHabit = Habit(title: name, image: image)
           self.habits.insert(newHabit, at: 0) // Prepend the habits to the array
           self.saveHabits()

           return newHabit
       }
}


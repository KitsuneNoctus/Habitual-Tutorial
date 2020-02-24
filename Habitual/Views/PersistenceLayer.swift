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
}


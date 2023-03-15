//
//  WorkoutViewModel.swift
//  Liftey
//
//  Created by AlecNipp on 2/27/23.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workout = Workout(title: "Arms", notes: "Lift", exercises:
                                    [Exercise(name: "Chest press", reps: 4, sets: 4, weight: 80),
                                    Exercise(name: "French press", reps: 4, sets: 4, weight: 80),
                                    Exercise(name: "Military press", reps: 4, sets: 4, weight: 80)])
    @Published var isShowingSheet = false
    @Published var name = ""
    @Published var reps = 0
    @Published var sets = 0
    @Published var weight = 0
    
    var isValid: Bool {
        if name == "" {
            return false
        }
        if reps <= 0 {
            return false
        }
        if sets <= 0 {
            return false
        }
        if weight < 0 {
            return false
        }
        return true
    }

}

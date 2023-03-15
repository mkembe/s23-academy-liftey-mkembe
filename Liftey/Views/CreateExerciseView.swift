//
//  CreateExerciseView.swift
//  Liftey
//
//  Created by AlecNipp on 2/27/23.
//

import SwiftUI

struct CreateExerciseView: View {
    
    @StateObject var workout: WorkoutViewModel
    
    var body: some View {
        Form {
            Section("Exercise Name") {
                TextField("Enter an Exercise Name", text: $workout.name)
            }
            Section("Details") {
                Stepper("**Reps:** \(workout.reps) ", value: $workout.reps)
                Stepper("**Sets:** \(workout.sets) ", value: $workout.sets)
                HStack {
                    Text("**Weight:**")
                    TextField("", value: $workout.weight, formatter: NumberFormatter())
                        .fixedSize()
                    Text("lbs")
                }
            }
            Button {
                workout.workout.exercises.append(Exercise(name: workout.name, reps: workout.reps, sets: workout.sets, weight: workout.weight))
                workout.isShowingSheet.toggle()
                workout.name = ""
                workout.reps = 0
                workout.sets = 0
                workout.weight = 0

            } label: {
                Text("Create Exercise")
            }
            .disabled(workout.isValid == false)
            
        }
    }
}

struct CreateExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CreateExerciseView(workout: WorkoutViewModel())
    }
}

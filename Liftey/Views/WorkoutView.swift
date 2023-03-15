//
//  WorkoutView.swift
//  Liftey
//
//  Created by AlecNipp on 2/27/23.
//

import SwiftUI

struct WorkoutView: View {
    
    @StateObject var workout: WorkoutViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section("Exercises") {
                    ForEach(workout.workout.exercises) { exercise in
                        ExerciseRowItemView(exercise: exercise)
                    }
                }
            }
            .navigationTitle("My Workout")
            .toolbar {
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        workout.isShowingSheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)

                        Text("**Create Exercise**")
                    }
                    .sheet(isPresented: $workout.isShowingSheet) {
                        CreateExerciseView(workout: workout)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workout: WorkoutViewModel())
    }
}

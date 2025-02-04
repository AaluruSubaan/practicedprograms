//
//  AddWorkoutHistoryView.swift
//  FitnessApplication
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct AddWorkoutHistoryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var exerciseName: String = ""
    @State private var duration: Double
    @State private var caloriesBurned: Double
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("ExerciseName", text:$exerciseName)
                    
                }
                Section{
                    Button("save"){
                        save()
                    }
                }
            }.navigationTitle("AddExerciseName")
        }
    }
    private func save(){
        guard !exerciseName.isEmpty else {return}
        let newWorkout = Workout(context: viewContext)
        newWorkout.exerciseName = exerciseName
        newWorkout.caloriesBurned = caloriesBurned
        newWorkout.duration = duration
    }
}

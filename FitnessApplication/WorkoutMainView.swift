//
//  WorkoutMainView.swift
//  FitnessApplication
//
//  Created by admin on 04/02/25.
//

import SwiftUI
import CoreData
struct WorkoutMainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Workout.entity(), sortDescriptors: []) private var workouts: FetchedResults<Workout>
    @State private var isShowingAddWorkout = false
    var body: some View {
        NavigationView{
            List{
                ForEach(workouts){ workout in
                    VStack(alignment: .leading){
                        Text("Enter the Exercise Name: \(workout.exerciseName ?? "UnknownName")")
                            .font(.headline)
                        Text("Duration: \(workout.duration, specifier: "%.2f")minutes")
                            .font(.headline)
                        Text("CaloriesBurned: \(workout.caloriesBurned, specifier: "%.2f")").font(.subheadline)
                    }
                }
            }
        }.navigationTitle("ListOfWorkouts")
            .navigationBarItems(leading: EditButton(),trailing:  Button(action: { isShowingAddWorkout = true}){
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isShowingAddWorkout){
                AddWorkoutHistoryView()
            }
    }
}
       


struct WorkoutMainView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMainView()
    }
}

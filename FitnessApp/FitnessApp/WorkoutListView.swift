//
//  WorkoutListView.swift
//  FitnessApp
//
//  Created by admin on 03/02/25.
//

import SwiftUI
import CoreData
struct WorkoutListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Workout.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Workout.date,ascending: false)]) private var workouts: FetchedResults<Workout>
    @State private var isShowingAddWorkout = false
    var body: some View {
        NavigationView{
            List{
                ForEach(workouts){
                    workout in NavigationLink(destination: ExerciseListView(workout: workout)){
                        VStack(alignment: .leading){
                            Text(workout.name ?? "UnnamedWorkout")
                                .font(.headline)
                            Text("\(workout.date ?? Date(),formatter:  workoutDateFormatter)")
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: deleteWorkouts)
            }
            .navigationTitle("workouts")
            .navigationBarItems(leading: EditButton(),trailing: Button(action:{ isShowingAddWorkout = true}){
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isShowingAddWorkout){
                AddWorkoutView()
            }
        }
    }
    private func deleteWorkouts(at offsets: IndexSet){
        for index in offsets{
            let workout = workouts[index]
            viewContext.delete(workout)
        }
        saveContext()
    }
    private func saveContext(){
        do{
            try viewContext.save()}
        catch{
            print("Failed to save Context: \(error.localizedDescription)")
        }
    }
    private let workoutDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView()
    }
}

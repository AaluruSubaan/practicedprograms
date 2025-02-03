//
//  AddWorkoutView.swift
//  FitnessApp
//
//  Created by admin on 03/02/25.
//

import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var workoutName: String = ""
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("WorkOut Name", text:$workoutName)
                }
                Section{
                    Button("save"){
                        saveWorkout()
                    }
                }
            }
            .navigationTitle("Add WorkOut")
        }
        
    }
    private func saveWorkout(){
        guard !workoutName.isEmpty else {return}
        let newWorkout = Workout(context: viewContext)
        newWorkout.name = workoutName
        newWorkout.date = Date()
        do{
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()}
        catch{
            print("Failed to save Workout: \(error.localizedDescription)")
        }
        
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView()
    }
}

//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by admin on 03/02/25.
//

import SwiftUI

@main
struct FitnessAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            WorkoutListView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

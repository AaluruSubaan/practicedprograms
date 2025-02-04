//
//  FitnessApplicationApp.swift
//  FitnessApplication
//
//  Created by admin on 04/02/25.
//

import SwiftUI

@main
struct FitnessApplicationApp: App {
    let persistenceController = PersistenceController()
    var body: some Scene {
        WindowGroup {
        WorkoutMainView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

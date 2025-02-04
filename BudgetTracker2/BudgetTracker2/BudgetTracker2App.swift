//
//  BudgetTracker2App.swift
//  BudgetTracker2
//
//  Created by admin on 28/01/25.
//

import SwiftUI

@main
struct BudgetTracker2App: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            DashboardView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

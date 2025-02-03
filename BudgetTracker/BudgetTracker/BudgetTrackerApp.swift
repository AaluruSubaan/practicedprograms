//
//  BudgetTrackerApp.swift
//  BudgetTracker
//
//  Created by admin on 30/01/25.
//

import SwiftUI

@main
struct BudgetTrackerApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            TransactionListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

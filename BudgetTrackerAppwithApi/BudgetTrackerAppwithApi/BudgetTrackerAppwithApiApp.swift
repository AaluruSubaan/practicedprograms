//
//  BudgetTrackerAppwithApiApp.swift
//  BudgetTrackerAppwithApi
//
//  Created by admin on 04/02/25.
//

import SwiftUI

@main
struct BudgetTrackerAppwithApiApp: App {
   let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup{
          TransactionList(context: persistenceController.container.viewContext).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

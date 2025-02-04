//
//  TaskManagerAppApp.swift
//  TaskManagerApp
//
//  Created by admin on 03/02/25.
//

import SwiftUI

@main
struct TaskManagerAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        
        WindowGroup {
            TaskListView().environment(\.managedObjectContext,persistenceController.container.viewContext)
        }
    }
}

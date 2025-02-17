//
//  ElearningAppApp.swift
//  ElearningApp
//
//  Created by admin on 15/02/25.
//

import SwiftUI

@main
struct ElearningAppApp: App {
    let persistentController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            LoginView().environment(\.managedObjectContext, persistentController.container.viewContext)
        }
    }
}

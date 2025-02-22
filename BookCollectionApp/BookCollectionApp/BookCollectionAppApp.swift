//
//  BookCollectionAppApp.swift
//  BookCollectionApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

@main
struct BookCollectionAppApp: App {
    let persistentController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            BookListView().environment(\.managedObjectContext, persistentController.container.viewContext)
        }
    }
}

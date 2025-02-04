//
//  PersistenceController.swift
//  FitnessApplication
//
//  Created by admin on 04/02/25.
//

import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init (inMemory: Bool = false){
        container = NSPersistentContainer(name: "FitnessApplication")
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores{
            storeDescription, error in if let error = error as NSError? {
                fatalError("Unresolved Error \(error),\(error.userInfo)")
            }
        }
    }
}

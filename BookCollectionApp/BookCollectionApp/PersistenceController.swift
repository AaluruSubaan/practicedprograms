//
//  PersistenceController.swift
//  BookCollectionApp
//
//  Created by admin on 01/02/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init (inMemory: Bool = false){
        container = NSPersistentContainer(name : "BookCollectionApp")
        if inMemory{
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores{_, error in if let error = error as NSError? {
            fatalError("UnResolved error \(error), \(error.userInfo)")
        }}
        
    }
    func saveContext(){
        let context = container.viewContext
        if context.hasChanges{
            try? context.save()
        }
    }
}

//
//  LocalDataService.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import CoreData
import Foundation

final class LocalDataService {
    
    // MARK: - Singleton
    static let shared = LocalDataService()
    
    // MARK: - Persistent Container
    let persistentContainer: NSPersistentContainer
    
    private init() {
        // Replace "ColleXModel" with the name of your Core Data model file
        persistentContainer = NSPersistentContainer(name: "ColleXModel")
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                // In production, handle the error appropriately instead of using fatalError.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            } else {
                print("Core Data store loaded: \(storeDescription)")
            }
        }
    }
    
    // MARK: - Managed Object Context
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Save Context
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Context saved successfully.")
            } catch {
                let nserror = error as NSError
                // Handle the error appropriately in production.
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

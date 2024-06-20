//
//  PersistenceController.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 29/08/23.
//

import Foundation
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        let data = YoutubeData(context: controller.container.viewContext)
        data.viewCount = 10000
        data.date = Date.from(year: 2023, month: 1, day: 1)
        
        return controller
        
    }()
    
//    // An initializer to load Core Data, optionally able
//    // to use an in-memory store.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                // throw some error
            }
        }
    }
}

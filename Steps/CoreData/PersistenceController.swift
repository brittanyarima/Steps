//
//  PersistenceController.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        for _ in 0..<10 {
            let task = Task(context: controller.container.viewContext)
            task.id = UUID()
            task.name = "Run a marathon"
            task.date = Date()
            task.isComplete = Bool.random()
        }
        return controller
    }()

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Steps")

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
            } catch {
                print("❗️Error saving to core data. \(error.localizedDescription)")
            }
        }
    }
}

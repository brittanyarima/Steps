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

        // Create 10 example programming languages.
        for _ in 0..<10 {
            let task = Task(context: controller.container.viewContext)
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
  }

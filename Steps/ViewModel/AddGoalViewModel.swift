
//
//  AddGoalViewModel.swift
//  Steps
//
//  Created by Daniel Lyons on 10/6/23.
//

import SwiftUI
import Combine
import CoreData

final class AddGoalViewModel: ObservableObject {
    let context: NSManagedObjectContext
    @Published var name = ""
    @Published var isComplete = false
    @Published var date = Date()

    init(
        context: NSManagedObjectContext = PersistenceController.shared.container.viewContext,
        name: String = "",
        isComplete: Bool = false,
        date: Date = Date()
    ) {
        self.context = context
        self.name = name
        self.isComplete = isComplete
        self.date = date
    }
<<<<<<< HEAD:Steps/ViewModel/AddGoalViewModel.swift
    
    func addGoal() {
        let newGoal = Goal(context: self.context)
        newGoal.name = self.name
        newGoal.isComplete = self.isComplete
        newGoal.date = self.date
        newGoal.id = UUID()
        
=======

    func addTask() {
        let newTask = Task(context: self.context)
        newTask.name = self.name
        newTask.isComplete = self.isComplete
        newTask.date = self.date
        newTask.id = UUID()

>>>>>>> dev:Steps/ViewModel/AddTaskViewModel.swift
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

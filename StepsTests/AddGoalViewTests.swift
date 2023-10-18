//
//  AddTaskViewTests.swift
//  StepsTests
//
//  Created by Daniel Lyons on 10/6/23.
//

import XCTest
import Dependencies
@testable import Steps

@MainActor
final class AddGoalViewTests: XCTestCase {
    func testAddTask() {
        let persistenceController = PersistenceController.preview
        let addTaskView = AddGoalView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        
    }
}

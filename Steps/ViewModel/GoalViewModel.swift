
//
//  GoalViewModel.swift
//  Steps
//
//  Created by Daniel Lyons on 10/6/23.
//

import Combine
import CoreData

final class GoalViewModel: ObservableObject {
    let context: NSManagedObjectContext
    @Published var selectedTab = TextConstants.incomplete.value
    @Published var isShowingSheet = false
    @Published var isShowingPaywall = true

    init(
        context: NSManagedObjectContext = PersistenceController.shared.container.viewContext,
        selectedTab: String = TextConstants.incomplete.value,
        isShowingSheet: Bool = false,
        isShowingPaywall: Bool = true
    ) {
        self.context = context
        self.isShowingSheet = isShowingSheet
        self.selectedTab = selectedTab
        self.isShowingPaywall = isShowingPaywall
    }
}

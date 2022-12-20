//
//  SettingsViewModel.swift
//  Steps
//
//  Created by Brittany Rima on 12/20/22.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var showingEditView = false
    @Published var notificationsOn = false
    @Published var remindersOn = false
    @Published var goalCompletionNotificationOn = false
}

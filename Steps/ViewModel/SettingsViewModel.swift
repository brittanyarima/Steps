//
//  SettingsViewModel.swift
//  Steps
//
//  Created by Brittany Rima on 12/20/22.
//

import SwiftUI
import UserNotifications
import DependenciesAdditions

class SettingsViewModel: ObservableObject {
    @Published var showingEditView = false
    @Published var showContributors: Bool = false

    @AppStorage(Constants.notificationKey) var notificationsOn = false
    @Dependency(\.userNotificationCenter) var userNotificationCenter
    @Dependency(\.logger) var logger

    func requestNotificationAuth() async {
        do {
            let isAuthorized = try await userNotificationCenter.requestAuthorization(
                options: [.alert, .badge, .sound, .provisional]
            )
            if isAuthorized {
                await self.scheduleDailyNotification()
            } else {
                self.userNotificationCenter.removeAllPendingNotificationRequests()
            }
        } catch {
            logger.error("Error requesting authorization from UserNotificationCenter: \(error)")
        }
    }

    func scheduleDailyNotification() async {
        let content = UNMutableNotificationContent()
        content.title = Constants.goodMorningTitle
        content.body = Constants.reachStepGoalDescription

        var dateComponents = DateComponents()
        dateComponents.hour = 9
        dateComponents.minute = 0

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: Constants.notificationsIdentifier, content: content, trigger: trigger)
        
        do {
            try await self.userNotificationCenter.add(request)
        } catch {
            logger.error("Error scheduling notifications: \(error.localizedDescription)")
        }
    }
}


import XCTest
import Dependencies
import DependenciesAdditions
@testable import Steps

@MainActor
final class SettingsViewTests: XCTestCase {
    func testScheduleDailyNotification() async throws {
        let vm = SettingsViewModel()
        
        await vm.scheduleDailyNotification()
        @Dependency(\.userNotificationCenter) var userNotificationCenter
        let pendingNotifications = await userNotificationCenter.pendingNotificationRequests()
        let addedNotification = pendingNotifications[0]
        
        
        XCTAssertEqual(addedNotification.identifier, Constants.notificationsIdentifier)
        let content = addedNotification.content
        XCTAssertEqual(content.title, Constants.goodMorningTitle)
        XCTAssertEqual(content.body, Constants.reachStepGoalDescription)
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: DateComponents(hour: 9, minute: 0),
            repeats: true
        )
        XCTAssertEqual(addedNotification.trigger, trigger)
        
    }
}

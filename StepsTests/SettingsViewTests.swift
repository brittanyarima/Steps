
import XCTest
import Dependencies
import DependenciesAdditions
import UserNotifications
@testable import Steps


@MainActor
final class SettingsViewTests: XCTestCase {
    func testScheduleDailyNotification() async throws {
        let vm = SettingsViewModel()
        let requests = ActorIsolated<[UNNotificationRequest]>([])
        
        await withDependencies {
            let add = { @Sendable userNotificationRequest in
                await requests.setValue([userNotificationRequest])
            }
            $0.userNotificationCenter.$add = add
            $0.userNotificationCenter.$pendingNotificationRequests = { @Sendable in
                return await requests.value
            }
            
        } operation: {
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
}

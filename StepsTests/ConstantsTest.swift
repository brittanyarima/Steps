//
//  ConstantsTest.swift
//  StepsTests
//
//  Created by MacBook AIR on 28/09/2024.
//

import Foundation
import XCTest
@testable import Steps

class ConstantsTests: XCTestCase {

    func testTermsURL() {
        XCTAssertEqual(Constants.termsURL, "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")
    }

    func testPrivacyURL() {
        XCTAssertEqual(Constants.privacyURL, "https://sites.google.com/view/steptrackerapp/home")
    }

    func testAppGroupID() {
        XCTAssertEqual(Constants.appGroupID, "group.com.BrittanyRima.Steps")
    }

    func testKeys() {
        XCTAssertEqual(Constants.goalKey, "goal")
        XCTAssertEqual(Constants.notificationKey, "notifications")
        XCTAssertEqual(Constants.stepCountKey, "stepCount")
        XCTAssertEqual(Constants.backgroundImageKey, "backgroundImage")
    }

    func testLocalizedStrings() {
        XCTAssertEqual(Constants.steps, "Steps")
        XCTAssertEqual(Constants.weeklySteps, "Weekly Steps")
        XCTAssertEqual(Constants.dailyGoal, "Daily Goal")
        XCTAssertEqual(Constants.addNewGoal, "Add New Goal")
        XCTAssertEqual(Constants.notifications, "Notifications")
    }

    func testAwardDescriptions() {
        XCTAssertEqual(Constants.firstStepsDescription, "You took more than 100 steps this week, you're on your way to your goal. Keep it up!")
        XCTAssertEqual(Constants.goalDescription, "You reached your step goal at least once this week!")
        XCTAssertEqual(Constants.doubleTroubleDescription, "You doubled your steps goal this week! You are incredible!")
        XCTAssertEqual(Constants.perfectWeekDescription, "You reached your steps goal every day the past 7 days. You are incredible!")
    }

    func testWidgetDescriptions() {
        XCTAssertEqual(Constants.stepsWidgetDescription, "View your current steps count and progress.")
        XCTAssertEqual(Constants.stepsGraphWidgetDescription, "View your steps progress throughout the day.")
    }

    func testTabTitles() {
        XCTAssertEqual(Constants.homeTab, "Home")
        XCTAssertEqual(Constants.goalsTab, "Goals")
        XCTAssertEqual(Constants.awardsTab, "Awards")
        XCTAssertEqual(Constants.stepsTab, "Steps")
        XCTAssertEqual(Constants.settingsTab, "Settings")
    }
}

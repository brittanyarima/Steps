//
//  Constants.swift
//  Steps
//
//  Created by Brittany Rima on 12/23/22.
//

import Foundation
import SwiftUI

struct Constants {
    // MARK: URLs
    static let termsURL = "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/"
    static let privacyURL = "https://sites.google.com/view/steptrackerapp/home"
    
    // MARK: Identifiers
    static let appGroupID = "group.com.BrittanyRima.Steps"

    static let goalKey = "goal"
    static let notificationKey = "notifications"
    static let notificationsIdentifier = "daily-notification"

    static let stepCountKey = "stepCount"
    static let backgroundImageKey = "backgroundImage"
}

enum TextConstants {
    // MARK: Messages
    case steps
    case weeklySteps
    case goal
    case day
    case dailyGoal
    case soccerball
    case done
    case firstStepsName
    case firstStepsDescription
    case goalName
    case goalDescription
    case doubleTroubleName
    case doubleTroubleDescription
    case threesName
    case threesDescription
    case perfectWeekName
    case perfectWeekDescription
    case messiName
    case soccerFieldDescription
    case motivatedName
    case motivatedDescription
    case firstGoalName
    case firstGoalDescription
    case dreamerGoalName
    case dreamerGoalDescription
    case goGetterName
    case goGetterDescription
    case dailyStepsGoal
    case enterSteps
    case currentSteps
    case addNewGoal
    case goalIdeas
    case walkWithFriend
    case newGoalField
    case save
    case unknownName
    case unlockAwardsDesc
    case weeklyAwards
    case notifications
    case notificationSettings
    case termsOfUse
    case privacyPolicy
    case settingsTitle
    case newDailyStepsGoal
    case haveNotUnlockedAwardDesc
    case locked
    case myGoals
    case addGoal
    case goalsTitle
    case addSomeMoreGoals
    case week
    case month
    case incomplete
    case complete
    case coreDataError
    case goodMorningTitle
    case reachStepGoalDescription
    case walkedOneSoccerFieldToday
    case walkedFullSoccerFieldToday
    case walkedCustomSoccerFieldToday
    case stepsWidget
    case stepsWidgetName
    case stepsWidgetDescription
    case stepsGraphWidget
    case stepsGraphWidgetName
    case stepsGraphWidgetDescription
    case homeTab
    case goalsTab
    case awardsTab
    case stepsTab
    case settingsTab
    
    var value: String {
        let value: LocalizedStringResource
        
        switch self {
        case .steps:
            value = LocalizedStringResource("Steps")
        case .weeklySteps:
            value = LocalizedStringResource("Weekly Steps")
        case .goal:
            value = LocalizedStringResource("Goal")
        case .day:
            value = LocalizedStringResource("Day")
        case .dailyGoal:
            value = LocalizedStringResource("Daily Goal")
        case .soccerball:
            value = LocalizedStringResource("soccerball")
        case .done:
            value = LocalizedStringResource("Done")
        case .firstStepsName:
            value = LocalizedStringResource("First Steps")
        case .firstStepsDescription:
            value = LocalizedStringResource("You took more than 100 steps this week, you're on your way to your goal. caset up!")
        case .goalName:
            value = LocalizedStringResource("Gooooaaaaal")
        case .goalDescription:
            value = LocalizedStringResource("You reached your step goal at least once this week!")
        case .doubleTroubleName:
            value = LocalizedStringResource("Double Trouble")
        case .doubleTroubleDescription:
            value = LocalizedStringResource("You doubled your steps goal this week! You are incredible!")
        case .threesName:
            value = LocalizedStringResource("Threes")
        case .threesDescription:
            value = LocalizedStringResource("You tripled your steps goal this week! Wow!")
        case .perfectWeekName:
            value = LocalizedStringResource("Perfect Week")
        case .perfectWeekDescription:
            value = LocalizedStringResource("You reached your steps goal every day the past 7 days. You are incredible!")
        case .messiName:
            value = LocalizedStringResource("Don't Messi With You")
        case .soccerFieldDescription:
            value = LocalizedStringResource("You walked 100 soccer fields in a single day this week! ")
        case .motivatedName:
            value = LocalizedStringResource("Motivated")
        case .motivatedDescription:
            value = LocalizedStringResource("You created your first goal!")
        case .firstGoalName:
            value = LocalizedStringResource("First Goal!")
        case .firstGoalDescription:
            value = LocalizedStringResource("You completed your first goal!")
        case .dreamerGoalName:
            value = LocalizedStringResource("Dreamer")
        case .dreamerGoalDescription:
            value = LocalizedStringResource("You created 5 goals!")
        case .goGetterName:
            value = LocalizedStringResource("Go Getter")
        case .goGetterDescription:
            value = LocalizedStringResource("You completed 5 goals!")
        case .dailyStepsGoal:
            value = LocalizedStringResource("Daily Steps Goal")
        case .enterSteps:
            value = LocalizedStringResource("%i steps")
        case .currentSteps:
            value = LocalizedStringResource("Current Steps")
        case .addNewGoal:
            value = LocalizedStringResource("🖋️ Add New Goal")
        case .goalIdeas:
            value = LocalizedStringResource("💡 Goal ideas")
        case .walkWithFriend:
            value = LocalizedStringResource("Walk a 5K, Walk with a friend, Increase steps goal")
        case .newGoalField:
            value = LocalizedStringResource("New goal...")
        case .save:
            value = LocalizedStringResource("Save")
        case .unknownName:
            value = LocalizedStringResource("Unknown Name")
        case .unlockAwardsDesc:
            value = LocalizedStringResource("Can you can unlock all of these awards this week?")
        case .weeklyAwards:
            value = LocalizedStringResource("🏆 Weekly Awards")
        case .notifications:
            value = LocalizedStringResource("Notifications")
        case .notificationSettings:
            value = LocalizedStringResource("Notification settings")
        case .termsOfUse:
            value = LocalizedStringResource("Terms of Use")
        case .privacyPolicy:
            value = LocalizedStringResource("Privacy Policy")
        case .settingsTitle:
            value = LocalizedStringResource("⚙️ Settings")
        case .newDailyStepsGoal:
            value = LocalizedStringResource("Set a New Daily Steps Goal")
        case .haveNotUnlockedAwardDesc:
            value = LocalizedStringResource("You haven't unlocked this award yet this week. Keep getting those steps case completing goals to unlock it. You can do it!")
        case .locked:
            value = LocalizedStringResource("Locked")
        case .myGoals:
            value = LocalizedStringResource("✅ My Goals")
        case .addGoal:
            value = LocalizedStringResource("Add Goal")
        case .goalsTitle:
            value = LocalizedStringResource("Goals")
        case .addSomeMoreGoals:
            value = LocalizedStringResource("🥳 Time to add some more goals!")
        case .week:
            value = LocalizedStringResource("Week")
        case .month:
            value = LocalizedStringResource("Month")
        case .incomplete:
            value = LocalizedStringResource("Incomplete")
        case .complete:
            value = LocalizedStringResource("Complete")
        case .coreDataError:
            value = LocalizedStringResource("❗️ Error saving delete goal to core data")
        case .goodMorningTitle:
            value = LocalizedStringResource("Good Morning!")
        case .reachStepGoalDescription:
            value = LocalizedStringResource("Try to reach your steps goal today. We believe in you!")
        case .walkedOneSoccerFieldToday:
            value = LocalizedStringResource("You've walked about 1 soccer field today so far. Keep it up!")
        case .walkedFullSoccerFieldToday:
            value = LocalizedStringResource("Keep walking. You've almost walked a full soccer field today so far!")
        case .walkedCustomSoccerFieldToday:
            value = LocalizedStringResource("You've walked about %i soccer fields today so far. Keep it up!")
        case .stepsWidget:
            value = LocalizedStringResource("StepsWidget")
        case .stepsWidgetName:
            value = LocalizedStringResource("Current Steps")
        case .stepsWidgetDescription:
            value = LocalizedStringResource("View your current steps count and progress.")
        case .stepsGraphWidget:
            value = LocalizedStringResource("StepsGraphWidget")
        case .stepsGraphWidgetName:
            value = LocalizedStringResource("Steps Graph")
        case .stepsGraphWidgetDescription:
            value = LocalizedStringResource("View your steps progress throughout the day.")
        case .homeTab:
            value = LocalizedStringResource("Home")
        case .goalsTab:
            value = LocalizedStringResource("Goals")
        case .awardsTab:
            value = LocalizedStringResource("Awards")
        case .stepsTab:
            value = LocalizedStringResource("Steps")
        case .settingsTab:
            value = LocalizedStringResource("Settings")
        }
        
        return String(localized: value)
    }
}

extension UserDefaults {
    static let appGroup: UserDefaults? = UserDefaults(suiteName: Constants.appGroupID)
}

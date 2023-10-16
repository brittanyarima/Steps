//
//  Constants.swift
//  Steps
//
//  Created by Brittany Rima on 12/23/22.
//

import Foundation

struct Constants {
    // MARK: URLs
    static let termsURL = "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/"
    static let privacyURL = "https://sites.google.com/view/steptrackerapp/home"
    
    // MARK: Identifiers
    static let appGroupID = "group.com.BrittanyRima.Steps"

    // MARK: Messages
    static let goalKey = "goal"
    static let notificationKey = "notifications"

    static let stepCountKey = "stepCount"
    static let backgroundImageKey = "backgroundImage"
    static let steps = NSLocalizedString("Steps", comment: "")
    static let weeklySteps = NSLocalizedString("Weekly Steps", comment: "Title for weekly steps")
    static let monthlySteps = "Monthly Steps"
    static let goal = "Goal"
    static let day = "Day"
    static let dailyGoal = NSLocalizedString("Daily Goal", comment: "daily goal label in the graph view of steps.")
    static let soccerball = "soccerball"
    static let done = NSLocalizedString("Done", comment: "Button title to edit steps goal")
    static let firstStepsName = "First Steps"
    static let firstStepsDescription = "You took more than 100 steps this week, you're on your way to your goal. Keep it up!"
    static let goalName = "Gooooaaaaal"
    static let goalDescription = "You reached your step goal at least once this week!"
    static let doubleTroubleName = "Double Trouble"
    static let doubleTroubleDescription = "You doubled your steps goal this week! You are incredible!"
    static let threesName = "Threes"
    static let threesDescription = "You tripled your steps goal this week! Wow!"
    static let perfectWeekName = "Perfect Week"
    static let perfectWeekDescription = "You reached your steps goal every day the past 7 days. You are incredible!"
    static let messiName = "Don't Messi With You"
    static let soccerFieldDescription = "You walked 100 soccer fields in a single day this week! "
    static let motivatedName = "Motivated"
    static let motivatedDescription = "You created your first goal!"
    static let firstGoalName = "First Goal!"
    static let firstGoalDescription = "You completed your first goal!"
    static let dreamerGoalName = "Dreamer"
    static let dreamerGoalDescription = "You created 5 goals!"
    static let goGetterName = "Go Getter"
    static let goGetterDescription = "You completed 5 goals!"
    static let dailyStepsGoal = "Daily Steps Goal"
    static let enterSteps = NSLocalizedString("%i steps", comment: "")
    static let currentSteps = NSLocalizedString("Current Steps", comment: "Title for current steps")
    static let addNewGoal = NSLocalizedString("Add New Goal", comment: "🖋️ Add New goal title")
    static let goalIdeas = NSLocalizedString("Goal ideas", comment: "💡Goal ideas label when creating new goal")
    static let walkWithFriend = NSLocalizedString("Walk a 5K, Walk with a friend, Increase steps goal", comment: "label message when creating a new goal.")
    static let newGoalField = NSLocalizedString("New goal...", comment: "New goal... label for text field in add new goal view.")
    static let save = NSLocalizedString("Save", comment: "Save label inside add new goal view.")
    static let unknownName = "Unknown Name"
    static let unlockAwardsDesc = NSLocalizedString("Can you can unlock all of these awards this week?", comment: "label below the Weekly award title inside weekly awards view")
    static let weeklyAwards = NSLocalizedString("Weekly Awards", comment: "Weekly awards title")
    static let notifications = NSLocalizedString("Notifications", comment: "Notifications label")
    static let notificationSettings = NSLocalizedString("Notification settings", comment: "Notifications settings label")
    
    /// The string to be passed into UNNotificationRequest
    static let notificationsIdentifier = "daily-notification"
    static let termsOfUse = NSLocalizedString("Terms of Use", comment: "Terms of use label")
    static let privacyPolicy = NSLocalizedString("Privacy Policy", comment: "privacy policy label")
    static let settingsTitle = NSLocalizedString("Settings", comment: "Settings title screen")
    static let newDailyStepsGoal = "Set a New Daily Steps Goal"
    static let haveNotUnlockedAwardDesc = NSLocalizedString("You haven't unlocked this award yet this week. Keep getting those steps in and completing goals to unlock it. You can do it!", comment: "message of weekly award blocked.")
    static let locked = NSLocalizedString("Locked", comment: "label title for locked")
    static let myGoals = NSLocalizedString(" My Goals", comment: "✅ My Goals view title ")
    static let addGoal = NSLocalizedString("Add Goal", comment: "Add goal label to add new a goal")
    static let goalsTitle = "Goals"
    static let addSomeMoreGoals = NSLocalizedString("Time to add some more goals!", comment: "🥳 Time to add some more goals label inside Goals view.")
    static let week = NSLocalizedString("Week", comment: "label title for week")
    static let month = NSLocalizedString("Month", comment: "label title for Month")
    static let incomplete = NSLocalizedString("Incomplete", comment: "Incomplete label to see incompleted goals")
    static let complete = NSLocalizedString("Complete", comment: "complete label to see completed goals")
    static let coreDataError = "❗️ Error saving delete goal to core data"
    static let goodMorningTitle = "Good Morning!"
    static let reachStepGoalDescription = "Try to reach your steps goal today. We believe in you!"
    static let walkedOneSoccerFieldToday = "You've walked about 1 soccer field today so far. Keep it up!"
    static let walkedFullSoccerFieldToday = NSLocalizedString("Keep walking. You've almost walked a full soccer field today so far!", comment: "Comment in the header of Steps view")
    static let walkedCustomSoccerFieldToday = "You've walked about %i soccer fields today so far. Keep it up!"
    static let stepsWidget = "StepsWidget"
    static let stepsWidgetName = NSLocalizedString("Current Steps", comment: "current steps label in the steps widget")
    static let stepsWidgetDescription = "View your current steps count and progress."
    static let stepsGraphWidget = "StepsGraphWidget"
    static let stepsGraphWidgetName = "Steps Graph"
    static let stepsGraphWidgetDescription = "View your steps progress throughout the day."

    // MARK: Tabs
    static let homeTab = NSLocalizedString("Home", comment: "Home tab title")
    static let goalsTab = NSLocalizedString("Goals", comment: "Goals tab title")
    static let awardsTab = NSLocalizedString("Awards", comment: "Awards tab title")
    static let stepsTab = NSLocalizedString("Steps", comment: "Steps tab title")
    static let settingsTab = NSLocalizedString("Settings", comment: "Settings tab title")
}

extension UserDefaults {
    static let appGroup: UserDefaults? = UserDefaults(suiteName: Constants.appGroupID)
}

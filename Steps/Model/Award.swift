//
//  Award.swift
//  Steps
//
//  Created by Brittany Rima on 12/16/22.
//

import SwiftUI

enum Award: String, CaseIterable {
    case firstStep
    case goal
    case doubleTrouble
    case threes
    case perfectweek
    case messi
    case motivated
    case firstGoal
    case dreamerGoal
    case goGetter

    var name: String {
        switch self {
        case .firstStep:
            return Constants.firstStepsName
        case .goal:
            return Constants.goalName
        case .doubleTrouble:
            return Constants.doubleTroubleName
        case .threes:
            return Constants.threesName
        case .perfectweek:
            return Constants.perfectWeekName
        case .messi:
            return Constants.messiName
        case .motivated:
            return Constants.motivatedName
        case .firstGoal:
            return Constants.firstGoalName
        case .dreamerGoal:
            return Constants.dreamerGoalName
        case .goGetter:
            return Constants.goGetterName
        }
    }

    var description: String {
        switch self {
        case .firstStep:
            return Constants.firstStepsDescription
        case .goal:
            return Constants.goalDescription
        case .doubleTrouble:
            return Constants.doubleTroubleDescription
        case .threes:
            return Constants.threesDescription
        case .perfectweek:
            return Constants.perfectWeekDescription
        case .messi:
            return Constants.soccerFieldDescription
        case .motivated:
            return Constants.motivatedDescription
        case .firstGoal:
            return Constants.firstGoalDescription
        case .dreamerGoal:
            return Constants.dreamerGoalDescription
        case .goGetter:
            return Constants.goGetterDescription
        }
    }

    var image: String {
        switch self {
        case .firstStep:
            return "figure.walk"
        case .goal:
            return "soccerball"
        case .doubleTrouble:
            return "figure.walk.motion"
        case .threes:
            return "figure.dance"
        case .perfectweek:
            return "medal"
        case .messi:
            return "sportscourt"
        case .motivated:
            return "checklist.unchecked"
        case .firstGoal:
            return "checkmark.seal"
        case .dreamerGoal:
            return "list.bullet.rectangle"
        case .goGetter:
            return "text.badge.checkmark.rtl"
        }
    }
}

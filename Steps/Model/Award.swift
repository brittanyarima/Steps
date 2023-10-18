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
            return TextConstants.firstStepsName.value
        case .goal:
            return TextConstants.goalName.value
        case .doubleTrouble:
            return TextConstants.doubleTroubleName.value
        case .threes:
            return TextConstants.threesName.value
        case .perfectweek:
            return TextConstants.perfectWeekName.value
        case .messi:
            return TextConstants.messiName.value
        case .motivated:
            return TextConstants.motivatedName.value
        case .firstGoal:
            return TextConstants.firstGoalName.value
        case .dreamerGoal:
            return TextConstants.dreamerGoalName.value
        case .goGetter:
            return TextConstants.goGetterName.value
        }
    }

    var description: String {
        switch self {
        case .firstStep:
            return TextConstants.firstStepsDescription.value
        case .goal:
            return TextConstants.goalDescription.value
        case .doubleTrouble:
            return TextConstants.doubleTroubleDescription.value
        case .threes:
            return TextConstants.threesDescription.value
        case .perfectweek:
            return TextConstants.perfectWeekDescription.value
        case .messi:
            return TextConstants.soccerFieldDescription.value
        case .motivated:
            return TextConstants.motivatedDescription.value
        case .firstGoal:
            return TextConstants.firstGoalDescription.value
        case .dreamerGoal:
            return TextConstants.dreamerGoalDescription.value
        case .goGetter:
            return TextConstants.goGetterDescription.value
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

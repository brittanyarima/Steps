//
//  Award.swift
//  Steps
//
//  Created by Brittany Rima on 12/16/22.
//

import SwiftUI

struct Award {
    let name: String
    let description: String
    let image: String
}

struct AwardData {
    static let awards = [
        Award(name: Constants.firstStepsName, description: Constants.firstStepsDescription, image: "figure.walk"),
        Award(name: Constants.goalName, description: Constants.goalDescription, image: "soccerball"),
        Award(name: Constants.doubleTroubleName, description: Constants.doubleTroubleDescription, image: "figure.walk.motion"),
        Award(name: Constants.threesName, description: Constants.threesDescription, image: "figure.dance"),
        Award(name: Constants.perfectWeekName, description: Constants.perfectWeekDescription, image: "medal"),
        Award(name: Constants.messiName, description: Constants.soccerFieldDescription, image: "sportscourt"),
        Award(name: Constants.motivatedName, description: Constants.motivatedDescription, image: "checklist.unchecked"),
        Award(name: Constants.firstGoalName, description: Constants.firstGoalDescription, image: "checkmark.seal"),
        Award(name: Constants.dreamerGoalName, description: Constants.dreamerGoalDescription, image: "list.bullet.rectangle"),
        Award(name: Constants.goGetterName, description: Constants.goGetterDescription, image: "text.badge.checkmark.rtl")
    ]
}

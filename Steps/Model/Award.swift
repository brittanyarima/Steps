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
    var isUnlocked: Bool
}

struct AwardData {
    static let awards = [
        Award(name: "First Steps", description: "You took more than 100 steps using this app. Keep it up!", image: "figure.walk", isUnlocked: false),
        Award(name: "Gooooaaaaal", description: "You reached your step goal!", image: "soccerball", isUnlocked: false),
        Award(name: "Double Trouble", description: "You doubled your steps goal! You are incredible!", image: "figure.walk.motion", isUnlocked: false),
        Award(name: "Threes", description: "You tripled your steps goal! Wow!", image: "figure.dance", isUnlocked: false),
        Award(name: "Self Care", description: "You updated your steps goal. Way to keep in touch with your health.", image: "trophy", isUnlocked: false),
        Award(name: "Perfect Week", description: "You reached your steps goal every day the past 7 days. You are incredible!", image: "medal", isUnlocked: false),
        Award(name: "Back At It", description: "You reached your steps goal for the first time in awhile. Way to get back at it. Keep it up!", image: "figure.step.training", isUnlocked: false),
        Award(name: "Steady Steps", description: "You had two perfect weeks! You've reached your step goal every day for the past 14 days. Way to stay consistent. (& maybe try upping your steps goal in the Settings tab if you feel like you want more of a challenge)", image: "calendar", isUnlocked: false)
    ]
}

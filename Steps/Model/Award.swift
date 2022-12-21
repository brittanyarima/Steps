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
        Award(name: "First Steps", description: "You took more than 100 steps this week, you're on your way to your goal. Keep it up!", image: "figure.walk"),
        Award(name: "Gooooaaaaal", description: "You reached your step goal at least once this week!", image: "soccerball"),
        Award(name: "Double Trouble", description: "You doubled your steps goal this week! You are incredible!", image: "figure.walk.motion"),
        Award(name: "Threes", description: "You tripled your steps goal this week! Wow!", image: "figure.dance"),
        Award(name: "Perfect Week", description: "You reached your steps goal every day the past 7 days. You are incredible!", image: "medal"),
        Award(name: "Don't Messi With You", description: "You walked 100 soccer fields in a single day this week! ", image: "sportscourt")
    ]
}

//
//  Step.swift
//  Steps
//
//  Created by Brittany Rima on 12/15/22.
//

import Foundation

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}

extension [Step] {
    static let mock: Self = [
        .init(count: 1_234, date: Date(timeIntervalSinceNow: -3600 * 4)),
        .init(count: 2_345, date: Date(timeIntervalSinceNow: -3600 * 3)),
        .init(count: 3_567, date: Date(timeIntervalSinceNow: -3600 * 2)),
        .init(count: 4_124, date: Date(timeIntervalSinceNow: -3600)),
        .init(count: 6_789, date: Date()),
    ]
    
    static let mock1Element: Self = Array(Self.mock[0...0])
    static let mock2Element: Self = Array(Self.mock[0...1])
    static let mock3Element: Self = Array(Self.mock[0...2])
    static let mock4Element: Self = Array(Self.mock[0...3])
    static let mock5Element: Self = Array(Self.mock[0...4])
}

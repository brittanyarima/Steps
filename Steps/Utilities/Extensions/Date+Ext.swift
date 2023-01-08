//
//  Date+Ext.swift
//  Steps
//
//  Created by Brittany Rima on 12/14/22.
//

import Foundation

extension Date {
    static func sundayAt12AM() -> Date {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear], from: Date()))!
    }

    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}

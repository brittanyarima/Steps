//
//  Package+Ext.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import Foundation
import RevenueCat

extension SubscriptionPeriod  {
    var durationTitle: String {
        switch self.unit {
        case .day: return "day"
        case .week: return "week"
        case .month: return "month"
        case .year: return "year"
        @unknown default: return "Unknown"
        }
    }

    var periodTitle: String {
        let periodString = "\(self.value) \(self.durationTitle)"
        let pluralized = self.value > 1 ? periodString + "s" : periodString
        return pluralized
    }
}


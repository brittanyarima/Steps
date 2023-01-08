//
//  UserViewModel.swift
//  Steps
//
//  Created by Brittany Rima on 1/8/23.
//

import SwiftUI
import RevenueCat

class UserViewModel: ObservableObject {
    @Published var isSubscriptionActive = false

    init() {
        Purchases.shared.getCustomerInfo { (customerInfo, error) in
            self.isSubscriptionActive = customerInfo?.entitlements.all["pro"]?.isActive == true
        }
    }
}

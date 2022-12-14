//
//  StepsViewModel.swift
//  Steps
//
//  Created by Brittany Rima on 12/14/22.
//

import Foundation
import HealthKit

class StepsViewModel: ObservableObject {
    let healthStore = HKHealthStore()
    
    @Published var steps = 0
    @Published var goal = 10000

   func loadSteps() {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let today = Date()
        let startOfDay = Calendar.current.startOfDay(for: today)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: today, options: .strictStartDate)

        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                return
            }
            DispatchQueue.main.async {
                self.steps = Int(sum.doubleValue(for: HKUnit.count()))
            }
        }

        healthStore.requestAuthorization(toShare: [stepsQuantityType], read: [stepsQuantityType]) { success, error in
            if success {
                self.healthStore.execute(query)
            } else {
                print("User didn't grant authorization: \(error?.localizedDescription)")
                // handle error here
            }
        }
    }
}

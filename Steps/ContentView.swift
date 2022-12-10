//
//  ContentView.swift
//  Steps
//
//  Created by Brittany Rima on 12/6/22.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    let healthStore = HKHealthStore()
    @State private var steps = 0

    var body: some View {
        NavigationStack {
            VStack {
                // Circle Progress bar here
                    // CircleProgressBar(value: self.steps, maxValue: 10000)
                Text("Steps: \(self.steps)")
            }
            .navigationTitle("🏃 Steps")
            .onAppear(perform: loadSteps)
        }
    }

    private func loadSteps() {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!

        let today = Date()
        let startOfDay = Calendar.current.startOfDay(for: today)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: today, options: .strictStartDate)

        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                return
            }
            self.steps = Int(sum.doubleValue(for: HKUnit.count()))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

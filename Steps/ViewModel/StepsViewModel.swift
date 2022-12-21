//
//  StepsViewModel.swift
//  Steps
//
//  Created by Brittany Rima on 12/14/22.
//

import Foundation
import HealthKit

class StepsViewModel: ObservableObject {
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?

    @Published var steps: [Step] = []
    @Published var goal = 8000

    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }

    var currentSteps: Int {
        steps.last?.count ?? 0
    }

    var soccerFieldsWalkedString: String {
        let numOfFields = currentSteps / 144 // For every 144 Steps you've walked about 1 soccer field.

        if numOfFields > 1 {
            return "You've walked about \(numOfFields) soccer fields today so far. Keep it up!"
        } else if numOfFields == 0 {
            return "Keep walking. You've almost walked a full soccer field today so far!"
        } else {
            return "You've walked about 1 soccer field today so far. Keep it up!"
        }
    }

    func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let anchorDate = Date.sundayAt12AM()
        let daily = DateComponents(day: 1)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)

        query = HKStatisticsCollectionQuery(quantityType: stepType,
                                    quantitySamplePredicate: predicate,
                                    options: .cumulativeSum,
                                    anchorDate: anchorDate,
                                    intervalComponents: daily)
        query!.initialResultsHandler = { query, statsCollection, error in
            completion(statsCollection)
        }

        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }

    func updateUIFromStats(_ statsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()

        statsCollection.enumerateStatistics(from: startDate, to: endDate) { stats, stop in
            let count = stats.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: stats.startDate)
            
            DispatchQueue.main.async {
                self.steps.append(step)
            }
        }
    }

    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        guard let healthStore = self.healthStore else { return  completion(false) }

        healthStore.requestAuthorization(toShare: [], read: [stepType]) { success, error in
            completion(success)
        }
    }

    var awardIsUnlocked: Bool {
        for award in AwardData.awards {
            switch award.name {
            case "First Steps":
                return steps.contains { $0.count > 100 }
            case "Gooooaaaaal":
                return steps.contains { $0.count >= goal }
            case "Double Trouble":
                return steps.contains { $0.count >= (goal * 2)}
            case "Threes":
                return steps.contains { $0.count >= (goal * 3)}
            case "Perfect Week":
                return steps.allSatisfy { $0.count >= goal }
            case "Don't Messi With You":
                return steps.contains { $0.count >= 14400 } // about 100 soccer fields

            default:
                return true
            }
        }
        return false
    }
}

//
//  StepsViewModel.swift
//  Steps
//
//  Created by Brittany Rima on 12/14/22.
//

import SwiftUI
import HealthKit

class StepsViewModel: ObservableObject {
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    @AppStorage("stepCount", store: UserDefaults(suiteName: "group.com.BrittanyRima.Steps")) var stepCount: Int = 0

    @Published var steps: [Step] = []
    @Published var goal: Int = 10000 {
        didSet {
            UserDefaults.standard.set(goal, forKey: Constants.goalKey)
        }
    }

    init() {
        self.goal = UserDefaults.standard.integer(forKey: Constants.goalKey)

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
            return String(format: Constants.walkedCustomSoccerFieldToday, numOfFields)
        } else if numOfFields == 0 {
            return Constants.walkedFullSoccerFieldToday
        } else {
            return Constants.walkedOneSoccerFieldToday
        }
    }

    var checkPointOneReached: Bool {
        Double(currentSteps) >= (Double(goal) * 0.25)
    }

    var checkPointTwoReached: Bool {
        Double(currentSteps) >= (Double(goal) * 0.5)
    }

    var checkPointThreeReached: Bool {
        Double(currentSteps) >= (Double(goal) * 0.75)
    }

    var checkPointFourReached: Bool {
        currentSteps >= goal
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
    
    func calculateLastWeeksSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let startDate = Calendar.current.date(byAdding: .weekOfYear, value: 6, to: Date())
        let anchorDate = Date.sundayAt12AM()
        let week = DateComponents(day: 1)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: stepType,
                                            quantitySamplePredicate: predicate,
                                            options: .cumulativeSum,
                                            anchorDate: anchorDate,
                                            intervalComponents: week)
        query!.initialResultsHandler = { query, statsCollection, error in
            completion(statsCollection)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }
    
    func calculateMonthSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let startDate = Calendar.current.date(byAdding: .month, value: -29, to: Date())
        let anchorDate = Date.sundayAt12AM()
        let month = DateComponents(day: 1)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: stepType,
                                            quantitySamplePredicate: predicate,
                                            options: .cumulativeSum,
                                            anchorDate: anchorDate,
                                            intervalComponents: month)
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
                self.stepCount = self.steps.last?.count ?? 0
            }
        }
    }
    
    func updateMonthUIFromStats(_ statsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
        let endDate = Date()

        statsCollection.enumerateStatistics(from: startDate, to: endDate) { stats, stop in
            let count = stats.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: stats.startDate)
            
            DispatchQueue.main.async {
                self.steps.append(step)
                self.stepCount = self.steps.last?.count ?? 0
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
}

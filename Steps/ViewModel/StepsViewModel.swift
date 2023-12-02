//
//  StepsViewModel.swift
//  Steps
//
//  Created by Brittany Rima on 12/14/22.
//

import SwiftUI
import HealthKit

import DependenciesAdditions
import Dependencies
import _AppStorageDependency
import PhotosUI
import CoreTransferable


class StepsViewModel: ObservableObject {
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    @AppStorage(Constants.stepCountKey, store: UserDefaults(suiteName: Constants.appGroupID)) var stepCount: Int = 0
    
    // 👇🏼 Still experimental
//    @Dependency.AppStorage(
//        Constants.stepCountKey,
//        store: .init(suitename: Constants.appGroupID)
//    ) var stepCount: Int = 0
    

    
    @Dependency(\.userDefaults) var userDefaults

    @Published var weekSteps: [Step] = [] // Data for the week chart
    @Published var monthSteps: [Step] = [] // Data for the month chart
    @Published var calories: [Calorie] = []
    @Published var totalDistance: [Distance] = []
    
    @Published var steps: [Step] = []
    @AppStorage(Constants.goalKey, store: .appGroup) var goal: Int = 10_000

    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
        
        self.backgroundImage = loadImage(key: Constants.backgroundImageKey)
    }

    var currentSteps: Int {
        steps.last?.count ?? 0
    }
    
    var currentCalories: Int {
        calories.last?.value ?? 0
    }
    
    var currentDistance: Int {
        totalDistance.last?.value ?? 0
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
        let startDate = Calendar.current.date(byAdding: .weekOfYear, value: -6, to: Date())
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
        let startDate = Calendar.current.date(byAdding: .day, value: -30, to: Date())
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
    
    func calculateCalories(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let calories = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let anchorDate = Date.sundayAt12AM()
        let daily = DateComponents(day: 1)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: calories,
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
    
    func calculateDistance(completion: @escaping (HKStatisticsCollection?) -> Void) {
        
        let distance = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let anchorDate = Date.sundayAt12AM()
        let daily = DateComponents(day: 1)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: distance,
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
                self.stepCount = self.steps.last?.count ?? 0
            }
        }
    }
    
    func updateWeekUIFromStats(_ statsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -6, to: Date())!
        let endDate = Date()
        statsCollection.enumerateStatistics(from: startDate, to: endDate) { stats, stop in
            let count = stats.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: stats.startDate)
            
            DispatchQueue.main.async {
                self.weekSteps.append(step)
                self.stepCount = self.weekSteps.last?.count ?? 0
            }
        }
    }
    
    func updateMonthUIFromStats(_ statsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
        let endDate = Date()
        statsCollection.enumerateStatistics(from: startDate, to: endDate) { stats, stop in
            let count = stats.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: stats.endDate)
            
            DispatchQueue.main.async {
                self.monthSteps.append(step)
                self.stepCount = self.monthSteps.last?.count ?? 0
            }
        }
    }
    
    func updateCalorieUIFromStats(_ statsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        
        statsCollection.enumerateStatistics(from: startDate, to: endDate) { stats, stop in
            let caloriesBurned = stats.sumQuantity()?.doubleValue(for: .largeCalorie())
            let calorie = Calorie(value: Int(caloriesBurned ?? 0), date: stats.startDate)
            
            DispatchQueue.main.async {
                self.calories.append(calorie)
            }
        }
    }
    
    func updateDistanceUIFromStats(_ statsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        
        statsCollection.enumerateStatistics(from: startDate, to: endDate) { stats, stop in
            let distanceWalked = stats.sumQuantity()?.doubleValue(for: .meter())
            let distance = Distance(value: Int(distanceWalked ?? 0), date: stats.startDate)
            
            DispatchQueue.main.async {
                self.totalDistance.append(distance)
            }
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let calorieType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        let distanceType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        guard let healthStore = self.healthStore else { return  completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [stepType, calorieType, distanceType]) { success, error in
            completion(success)
        }
    }
    
    // MARK: - Background Image
        
    @Published var showBackgroundImageAlert = false
    
    enum BackgroundImageState {
        case empty
        case loading(Progress)
        case success(UIImage)
        case failure(Error)
    }
    
    @Published var backgroundImage: UIImage? = nil
    
    @Published private(set) var backgroundImageState: BackgroundImageState = .empty {
        didSet {
            switch backgroundImageState {
            case .success(let image):
                backgroundImage = image
                saveImage(image: image, key: Constants.backgroundImageKey)
            case .loading:
                return
            case .empty:
                backgroundImage = nil
                deleteImage(key: Constants.backgroundImageKey)
            case .failure:
                self.showBackgroundImageAlert = true
            }
        }
    }
    
    @Published var backgroundImageSelection: PhotosPickerItem? = nil {
        didSet {
            if let backgroundImageSelection {
                let progress = loadTransferable(from: backgroundImageSelection)
                backgroundImageState = .loading(progress)
            } else {
                backgroundImageState = .empty
            }
        }
    }
    
    enum TransferError: Error {
        case importFailed
    }
    
    struct BackgroundImage: Transferable {
        let image: UIImage
        
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                return BackgroundImage(image: uiImage)
            }
        }
    }
    
    private func loadTransferable(from backgroundImageSelection: PhotosPickerItem) -> Progress {
        return backgroundImageSelection.loadTransferable(type: BackgroundImage.self) { result in
            DispatchQueue.main.async {
                guard backgroundImageSelection == self.backgroundImageSelection else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let backgroundImage?):
                    self.backgroundImageState = .success(backgroundImage.image)
                case .success(nil):
                    self.backgroundImageState = .empty
                case .failure(let error):
                    self.backgroundImageState = .failure(error)
                }
            }
        }
    }
}

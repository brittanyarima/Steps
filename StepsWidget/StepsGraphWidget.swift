//
//  StepsGraphWidget.swift
//  Steps
//
//  Created by Daniel Lyons on 10/3/23.
//

import Foundation
import WidgetKit
import SwiftUI
import HealthKit
import Charts

struct StepsGraphProvider: TimelineProvider {
    @AppStorage("stepCount", store: UserDefaults(suiteName: "group.com.BrittanyRima.Steps")) var stepCount: Int = 0
    @AppStorage("goal", store: UserDefaults(suiteName: "group.com.BrittanyRima.Steps")) var goal: Int = 10_000
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        }
    }
    
    func placeholder(in context: Context) -> StepsGraphEntry {
        StepsGraphEntry(stepsRecords: [Step(count: 364, date: Date())], goal: goal)
        
    }
    
    func getSnapshot(in context: Context, completion: @escaping (StepsGraphEntry) -> ()) {
        // TODO: get the steps count
        
        let entry = StepsGraphEntry(stepsRecords: [Step(count: 364, date: Date())], goal: goal)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<StepsGraphEntry>) -> ()) {
        // TODO: get the steps count
        
        let entry = StepsGraphEntry(stepsRecords: [Step(count: 364, date: Date())], goal: goal)
        let currentDate = Date()
        let futureDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        let timeline = Timeline(entries: [entry], policy: .after(futureDate))
        completion(timeline)
    }
    
//    mutating func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
//        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
//        let startDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
//        let anchorDate = Date.sundayAt12AM()
//        let daily = DateComponents(day: 1)
//        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
//        
//        query = HKStatisticsCollectionQuery(quantityType: stepType,
//                                            quantitySamplePredicate: predicate,
//                                            options: .cumulativeSum,
//                                            anchorDate: anchorDate,
//                                            intervalComponents: daily)
//        query!.initialResultsHandler = { query, statsCollection, error in
//            completion(statsCollection)
//        }
//        
//        if let healthStore = healthStore, let query = self.query {
//            healthStore.execute(query)
//        }
//    }
    
//    mutating func updateUIFromStats(_ statsCollection: HKStatisticsCollection) {
//        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
//        let endDate = Date()
//        
//        statsCollection.enumerateStatistics(from: startDate, to: endDate) { stats, stop in
//            let count = stats.sumQuantity()?.doubleValue(for: .count())
//            let step = Step(count: Int(count ?? 0), date: stats.startDate)
//            
//            DispatchQueue.main.async {
//                self.steps.append(step)
//                self.stepCount = self.steps.last?.count ?? 0
//            }
//        }
//    }
}

struct StepsGraphEntry: TimelineEntry {
    let date = Date()
    let stepsRecords: [Step]
    let goal: Int
    
    var progress: Double {
        guard let latestSteps = stepsRecords.last
        else { return 0.0 }
                
        return Double(latestSteps.count / goal)
    }
    
    var stepsCount: Int {
        return stepsRecords.last?.count ?? 0
    }
}

struct StepsGraphWidgetEntryView: View {
    var entry: StepsGraphProvider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    
    @ViewBuilder var systemMediumWidgetView: some View {
        HStack {
            VStack {
                ProgressView(value: Double(entry.stepsCount), total: Double(entry.goal)) {
                    Text("🏃")
                }.progressViewStyle(.circular)
                    .foregroundStyle(.indigo.gradient)
                    .padding([.top, .trailing, .bottom])
                Text("\(entry.stepsCount) / \(entry.goal)")
                    .font(.caption)
            }
            
            Chart(entry.stepsRecords) { record in
                Plot {
                    LineMark(x: .value("Date", record.date), y: .value("Steps", record.count))
                    AreaMark(x: .value("Date", record.date), y: .value("Steps", record.count))
                        .opacity(0.5)
                    
                    RuleMark(y: .value("Steps", entry.goal))
                        .foregroundStyle(.green.gradient)
                }
                .interpolationMethod(.cardinal(tension: 0.8))
                .foregroundStyle(.indigo.gradient)
                
            }
            .chartYAxis {
                AxisMarks { value in
                    AxisValueLabel(String(
                        "\(value.as(Double.self)?.formatted(.number.notation(.compactName)) ?? "")"
                    ))
                }
            }
        }
    }
    
    @ViewBuilder var systemLargeWidgetView: some View {
        VStack {
            Text("🏃 \(entry.stepsCount) / \(entry.goal.formatted(.number.notation(.compactName))) steps")
            
            Chart(entry.stepsRecords) { record in
                Plot {
                    LineMark(x: .value("Date", record.date), y: .value("Steps", record.count))
                    AreaMark(x: .value("Date", record.date), y: .value("Steps", record.count))
                        .opacity(0.5)
                    RuleMark(y: .value("Steps", entry.goal))
                        .foregroundStyle(.green.gradient)
                }
                .interpolationMethod(.cardinal(tension: 0.5))
                .foregroundStyle(.indigo.gradient)
            }
            .chartYAxis {
                AxisMarks { value in
                    AxisValueLabel(String(
                        "\(value.as(Double.self)?.formatted(.number.notation(.compactName)) ?? "")"
                    ))
                }
            }
        }
    }
    
    @ViewBuilder var accessoryRectangularWidgetView: some View {
        HStack {
            ProgressView(value: Double(entry.stepsCount), total: Double(entry.goal)) {
                Text("🏃")
            }.progressViewStyle(.circular)
            
            Chart(entry.stepsRecords) { record in
                Plot {
                    LineMark(x: .value("Date", record.date), y: .value("Steps", record.count))
                    AreaMark(x: .value("Date", record.date), y: .value("Steps", record.count))
                        .opacity(0.5)
                    RuleMark(y: .value("Steps", entry.goal))
                        .foregroundStyle(.green.gradient)
                }
                .interpolationMethod(.cardinal(tension: 0.5))
                .foregroundStyle(.indigo.gradient)
            }
            .chartYAxis {}
            .chartXAxis {}
        }
    }
    
    var body: some View {
        Group {
            switch widgetFamily {
                case .accessoryRectangular:
                    self.accessoryRectangularWidgetView
                case .systemMedium:
                    self.systemMediumWidgetView
                case .systemLarge:
                    self.systemLargeWidgetView
                default:
                    let _ = print("Unexpected widget family \(widgetFamily.description).")
                    self.systemMediumWidgetView
            }
        }.containerBackground()
    }
}

struct StepsGraphWidget: Widget {
    let kind: String = "StepsGraphWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: StepsGraphProvider()) { entry in
            StepsGraphWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Steps Graph")
        .description("View your steps progress throughout the day.")
        .supportedFamilies([.systemMedium, .systemLarge, .accessoryRectangular])
    }
}

struct StepsGraphWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        StepsGraphWidgetEntryView(entry: StepsGraphEntry(stepsRecords: .mock, goal: 10_000))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

struct StepsGraphWidgetLarge_Previews: PreviewProvider {
    static var previews: some View {
        StepsGraphWidgetEntryView(entry: StepsGraphEntry(stepsRecords: .mock, goal: 10_000))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

struct StepsGraphWidgetAccessoryRectangular_Previews: PreviewProvider {
    static var previews: some View {
        StepsGraphWidgetEntryView(entry: StepsGraphEntry(stepsRecords: .mock, goal: 10_000))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}



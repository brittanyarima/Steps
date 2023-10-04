//
//  StepsWidget.swift
//  StepsWidget
//
//  Created by Brittany Rima on 12/13/22.
//

import WidgetKit
import SwiftUI
import HealthKit

struct StepsProvider: TimelineProvider {
    @AppStorage("stepCount", store: UserDefaults(suiteName: "group.com.BrittanyRima.Steps")) var stepCount: Int = 0
    @AppStorage("goal", store: UserDefaults(suiteName: "group.com.BrittanyRima.Steps")) var goal: Int = 10_000
    
    func placeholder(in context: Context) -> StepEntry {
        StepEntry(steps: 5_678, goal: goal)
        
    }

    func getSnapshot(in context: Context, completion: @escaping (StepEntry) -> ()) {
        let entry = StepEntry(steps: stepCount, goal: goal)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<StepEntry>) -> ()) {
        let entry = StepEntry(steps: stepCount, goal: goal)
        let currentDate = Date()
        let futureDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        let timeline = Timeline(entries: [entry], policy: .after(futureDate))
        completion(timeline)
    }
}

struct StepEntry: TimelineEntry {
    let date = Date()
    let steps: Int
    let goal: Int
    
    var progress: Double {
        return Double(steps) / Double(goal)
    }
}

struct StepsWidgetEntryView : View {
    var entry: StepsProvider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    
    @ViewBuilder var accessoryWidgetView: some View {
        VStack(alignment: .trailing) {
            Text("🏃 \(entry.steps)")
                .font(.body)
                .bold()
        }
        .foregroundColor(.indigo)
    }
    
    @ViewBuilder var systemSmallWidgetView: some View {
        VStack(alignment: .center) {
            ProgressView(value: entry.progress) {
                Text("🏃")
            }
            .progressViewStyle(.circular)
            .foregroundStyle(.indigo)
            .font(.title2)
            
            Text("\(entry.steps) / \(entry.goal.formatted(.number.notation(.compactName)))")
                .font(.title2)
                .bold()
                .foregroundColor(.indigo)
        }
        
    }
    
    
    
    var body: some View {
        Group {
            switch widgetFamily {
                case .accessoryRectangular:
                    self.accessoryWidgetView
                case .systemSmall:
                    self.systemSmallWidgetView
                default:
                    let _ = print("Widget family \(widgetFamily.description).")
                    self.accessoryWidgetView
            }
        }.containerBackground()
    }
}

extension View {
    /// Calls [`.containerBackground(.thinMaterial, for: .widget)`](https://developer.apple.com/documentation/swiftui/view/containerbackground(_:for:)) if on iOS 17
    ///
    /// This is a workaround. Xcode 15 previews don't seem to work without this.
    @ViewBuilder
    func containerBackground() -> some View {
        // `containerBackground(_:for:)` is not available pre iOS 17
        if #available(iOSApplicationExtension 17.0, *) {
            self.containerBackground(.thinMaterial, for: .widget)
        } else {
            self
        }
    }
}


struct StepsWidget: Widget {
    let kind: String = "StepsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: StepsProvider()) { entry in
            StepsWidgetEntryView(entry: entry)
            
        }
        .configurationDisplayName("Current Steps")
        .description("View your current steps count and progress.")
        .supportedFamilies([.accessoryRectangular, .systemSmall])
    }
}

struct StepsWidget_Previews: PreviewProvider {
    static var previews: some View {
        StepsWidgetEntryView(entry: StepEntry(steps: 7200, goal: 10_000))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}

struct StepsWidgetSmall_Previews: PreviewProvider {
  static var previews: some View {
      StepsWidgetEntryView(entry: StepEntry(steps: 7_201, goal: 10_000))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}

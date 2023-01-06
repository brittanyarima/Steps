//
//  StepsWidget.swift
//  StepsWidget
//
//  Created by Brittany Rima on 12/13/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @AppStorage("stepCount", store: UserDefaults(suiteName: "group.com.BrittanyRima.Steps")) var stepCount: Int = 0


    func placeholder(in context: Context) -> StepEntry {
        StepEntry(steps: 7200)
    }

    func getSnapshot(in context: Context, completion: @escaping (StepEntry) -> ()) {
        let entry = StepEntry(steps: stepCount)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = StepEntry(steps: stepCount)
        let currentDate = Date()
        let futureDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
        let timeline = Timeline(entries: [entry], policy: .after(futureDate))
        completion(timeline)
    }
}

struct StepEntry: TimelineEntry {
    let date = Date()
    let steps: Int
}

struct StepsWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .trailing) {
            Text("🏃 \(entry.steps)")
                .font(.body)
                .bold()
                .foregroundColor(.indigo)
        }
        .padding()
    }
}

struct StepsWidget: Widget {
    let kind: String = "StepsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StepsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryRectangular])
    }
}

struct StepsWidget_Previews: PreviewProvider {
    static var previews: some View {
        StepsWidgetEntryView(entry: StepEntry(steps: 7200))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}

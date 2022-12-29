//
//  StepsWidget.swift
//  StepsWidget
//
//  Created by Brittany Rima on 12/13/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), steps: 7200)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), steps: 7200)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        var steps = StepsViewModel().currentSteps
        var goal = StepsViewModel().goal

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, steps: steps)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let steps: Int
}

struct StepsWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Circle()
                .stroke(.indigo.opacity(0.1), lineWidth: 10)

            Circle()
                .trim(from: 0, to: CGFloat(7200) / CGFloat(10000))
                .stroke(.indigo, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(Angle(degrees: -90.0))

            VStack {
                Text("7,200")
                    .bold()
                    .font(.title)
                    .foregroundColor(.indigo)


                Text("Steps")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
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
    }
}

struct StepsWidget_Previews: PreviewProvider {
    static var previews: some View {
        StepsWidgetEntryView(entry: SimpleEntry(date: Date(), steps: 7200))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

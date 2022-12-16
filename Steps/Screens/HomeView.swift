//
//  ContentView.swift
//  Steps
//
//  Created by Brittany Rima on 12/6/22.
//

import SwiftUI
import Charts


struct HomeView: View {
    @StateObject var viewModel = StepsViewModel()

    let steps: [Step] = [
        .init(count: 3000, date: Date.from(year: 2022, month: 1, day: 26)),
        .init(count: 4432, date: Date.from(year: 2022, month: 1, day: 27)),
        .init(count: 10000, date: Date.from(year: 2022, month: 1, day: 28)),
        .init(count: 900, date: Date.from(year: 2022, month: 1, day: 29)),
        .init(count: 1200, date: Date.from(year: 2022, month: 1, day: 30)),
        .init(count: 2300, date: Date.from(year: 2022, month: 1, day: 31)),
        .init(count: 6500, date: Date.from(year: 2022, month: 2, day: 1))
    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Weekly Steps")

                Chart {
                    RuleMark(y: .value("Goal", 8000))
                        .foregroundStyle(.mint)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))

                    ForEach(steps) { step in
                        BarMark(
                            x: .value("Day", step.date, unit: .weekday),
                            y: .value("Steps", step.count)
                        )
                        .foregroundStyle(.pink.gradient)
                    }
                }
                .frame(height: 180)
                .padding(.bottom)
                .chartXAxis {
                    AxisMarks(values: steps.map { $0.date}) { date in
                        AxisValueLabel(format: .dateTime.month().day())
                            .offset(x: 2.5) // hacky fix to the .centered bug
                    }
                }

                HStack {
                    Image(systemName: "line.diagonal")
                        .rotationEffect(Angle(degrees: 45))
                        .foregroundColor(.mint)

                    Text("Daily Goal")
                        .foregroundColor(.secondary)
                }
                .font(.caption2)
                .padding(.leading)
            }
            .padding()
            .navigationTitle("🏃 Steps")
            .onAppear {
                viewModel.requestAuthorization { success in
                    if success {
                        viewModel.calculateSteps { statsCollection in
                            if let statsCollection = statsCollection {
                                // update UI
                                viewModel.updateUIFromStats(statsCollection)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

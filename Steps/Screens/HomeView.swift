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

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Weekly Steps")

                Chart {
                    RuleMark(y: .value("Goal", 8000))
                        .foregroundStyle(.mint)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))

                    ForEach(viewModel.steps) { step in
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
                    AxisMarks(values: viewModel.steps.map { $0.date}) { date in
                        AxisValueLabel(format: .dateTime.month().day())
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

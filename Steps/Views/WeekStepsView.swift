//
//  WeekStepsView.swift
//  Steps
//
//  Created by Brittany Rima on 12/14/22.
//

import SwiftUI
import Charts

struct WeekStepsView: View {
    @ObservedObject var viewModel: StepsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Weekly Steps")

            Chart {
                RuleMark(y: .value("Goal", viewModel.goal))
                    .foregroundStyle(.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))

                ForEach(viewModel.steps) { step in
                    BarMark(
                        x: .value("Day", step.date, unit: .weekday),
                        y: .value("Steps", step.count)
                    )
                    .foregroundStyle(.indigo)
                }
            }
            .frame(height: 150)
            .padding()
            .chartXAxis {
                AxisMarks(values: viewModel.steps.map { $0.date}) { date in
                    AxisValueLabel(format: .dateTime.weekday(.abbreviated))
                        .offset(x: 5)
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
    }
}

struct WeekStepsView_Previews: PreviewProvider {
    static var previews: some View {
        WeekStepsView(viewModel: StepsViewModel())
    }
}

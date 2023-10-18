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
            Text(TextConstants.weeklySteps.value)

            Chart {
                RuleMark(y: .value(TextConstants.goal.value, viewModel.goal))
                    .foregroundStyle(.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))

                ForEach(viewModel.steps) { step in
                    BarMark(
                        x: .value(TextConstants.day.value, step.date, unit: .weekday),
                        y: .value(TextConstants.steps.value, step.count)
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

                Text(TextConstants.dailyGoal.value)
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

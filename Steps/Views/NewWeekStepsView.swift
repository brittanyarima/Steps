//
//  NewWeekStepsView.swift
//  Steps
//
//  Created by Mohd Wasif Raza on 04/10/23.
//

import SwiftUI
import Charts

struct NewWeekStepsView: View {
    @ObservedObject var viewModel: StepsViewModel

    var body: some View {
        VStack {
            HStack {
                Text(Constants.weeklySteps)
                Spacer()
            }
            .padding(.horizontal)

            Chart {
                RuleMark(y: .value(Constants.goal, viewModel.goal))
                    .foregroundStyle(.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                    .annotation(position: .automatic,  content: {
                        Text("Goal: \(viewModel.goal)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding()
                    })

                ForEach(viewModel.steps) { step in
                    BarMark(
                        x: .value(Constants.day, step.date, unit: .weekday),
                        y: .value(Constants.steps, step.count)
                    )
                    .foregroundStyle(.indigo)
                    .annotation(content: {
                        Text("\(step.count)")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    })
                }
            }
            .frame(height: 200)
            .padding()
            .chartXAxis {
                AxisMarks(values: viewModel.steps.map { $0.date}) { date in
                    AxisValueLabel(format:
                            .dateTime.month(.twoDigits).day())
                    .font(.caption2)
                }
            }
            .chartYAxis(.hidden)

            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.mint)

                Text(Constants.dailyGoal)
                    .foregroundColor(.secondary)
            }
            .font(.caption2)
            .padding(.leading)
        }
        .frame(maxWidth: 500)
    }
}


struct NewWeekStepsView_Previews: PreviewProvider {
    static var previews: some View {
        NewWeekStepsView(viewModel: StepsViewModel())
    }
}


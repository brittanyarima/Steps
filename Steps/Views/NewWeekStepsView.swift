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
        VStack(alignment: .leading) {
            Text("Weekly Steps")
            
            Chart {
                RuleMark(y: .value("Goal", viewModel.goal))
                    .foregroundStyle(.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                    .annotation(position: .topTrailing,  content: {
                        Text("\(viewModel.goal)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .offset(x: -15)
                    })
                
                ForEach(viewModel.steps) { step in
                    BarMark(
                        x: .value("Day", step.date, unit: .weekday),
                        y: .value("Steps", step.count)
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
            .chartXAxis
            {
                AxisMarks(values: viewModel.steps.map { $0.date}) { date in
                    AxisValueLabel(format:
                            .dateTime.weekday(.narrow)).offset(x:-20)
                    
                }
            }
            .chartYAxis(.hidden)
            
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


struct NewWeekStepsView_Previews: PreviewProvider {
    static var previews: some View {
        NewWeekStepsView(viewModel: StepsViewModel())
    }
}


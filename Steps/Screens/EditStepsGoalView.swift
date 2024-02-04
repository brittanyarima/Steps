//
//  EditStepsGoalView.swift
//  Steps
//
//  Created by Brittany Rima on 12/17/22.
//

import SwiftUI

struct EditStepsGoalView: View {
    @Binding var goal: Int
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text(Constants.newDailyStepsGoal)
                .font(.title3)
                .bold()
            Spacer()
            HStack(spacing: 20) {
                Text("\(goal)")
                    .font(.system(size: 34))
                    .bold()
                    .foregroundColor(.indigo)

                Stepper(Constants.steps, value: $goal, in: 1000...30000, step: 1000)
                    .labelsHidden()
            }

            Button(Constants.done) { dismiss() }
                .tint(.mint)
                .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
    }
}

struct EditStepsGoalView_Previews: PreviewProvider {
    static var previews: some View {
        EditStepsGoalView(goal: .constant(10000))
    }
}

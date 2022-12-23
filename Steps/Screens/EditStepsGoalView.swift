//
//  EditStepsGoalView.swift
//  Steps
//
//  Created by Brittany Rima on 12/17/22.
//

import SwiftUI

struct EditStepsGoalView: View {
    @State private var stepsGoal = 10000

    var body: some View {
        VStack {
            Text("Set a New Daily Steps Goal")
                .font(.title3)
                .bold()

            HStack(spacing: 20) {
                Text("\(stepsGoal)")
                    .font(.system(size: 34))
                    .bold()
                    .foregroundColor(.pink)

                Stepper("Steps", value: $stepsGoal, in: 100...30000, step: 100)
                    .labelsHidden()
            }

            HStack {
                Button("Cancel") {
                    // dismiss view
                }
                .tint(.pink)

                Button("Save") {
                    // save to core data
                }
                .tint(.mint)
            }
            .buttonStyle(.bordered)
        }
    }
}

struct EditStepsGoalView_Previews: PreviewProvider {
    static var previews: some View {
        EditStepsGoalView()
    }
}

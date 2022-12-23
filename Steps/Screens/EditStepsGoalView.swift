//
//  EditStepsGoalView.swift
//  Steps
//
//  Created by Brittany Rima on 12/17/22.
//

import SwiftUI

struct EditStepsGoalView: View {
    @Binding var goal: Int

    var body: some View {
        VStack {
            Text("Set a New Daily Steps Goal")
                .font(.title3)
                .bold()

            HStack(spacing: 20) {
                Text("\(goal)")
                    .font(.system(size: 34))
                    .bold()
                    .foregroundColor(.pink)

                Stepper("Steps", value: $goal, in: 100...30000, step: 100)
                    .labelsHidden()
            }

            Button("Done") {
                // dismiss view
            }
            .tint(.mint)
            .buttonStyle(.bordered)
        }
    }
}

struct EditStepsGoalView_Previews: PreviewProvider {
    static var previews: some View {
        EditStepsGoalView(goal: .constant(10000))
    }
}

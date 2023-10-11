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
            Text("Set a New Daily Steps Goal", comment: "Title for set a new daily steps goal")
                .font(.title3)
                .bold()
            Spacer()
            HStack(spacing: 20) {
                Text("\(goal)")
                    .font(.system(size: 34))
                    .bold()
                    .foregroundColor(.indigo)
                Stepper(value: $goal, in: 1000...30000, step: 1000) {
                    Text("Steps", comment: "Label for steps stepper")
                }
                .labelsHidden()
            }
            
            Button {
                dismiss()
            } label: {
                Text("Done", comment: "Button title to edit steps goal")
            }
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

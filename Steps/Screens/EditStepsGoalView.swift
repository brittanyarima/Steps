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

            Text("\(stepsGoal)")
                .font(.system(size: 34))
                .bold()
                .foregroundColor(.pink)

            Stepper("Steps", value: $stepsGoal)
        }
    }
}

struct EditStepsGoalView_Previews: PreviewProvider {
    static var previews: some View {
        EditStepsGoalView()
    }
}

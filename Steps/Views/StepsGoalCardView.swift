//
//  StepsGoalCardView.swift
//  Steps
//
//  Created by Brittany Rima on 12/17/22.
//

import SwiftUI

struct StepsGoalCardView: View {
    let steps: Int
    @Binding var showingEditView: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .cornerRadius(12)
                .shadow(radius: 5)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Daily Steps Goal")
                    Spacer()

                    Button {
                        showingEditView = true
                    } label: {
                        Image(systemName: "pencil.circle")
                    }
                }
                .foregroundColor(.indigo)

                Text("\(steps) steps")
                    .font(.system(size: 32))
                    .bold()
                    .foregroundColor(.indigo)

                Spacer()
            }
            .padding()
        }
        .frame(width: 300, height: 80)
    }
}

struct StepsGoalCardView_Previews: PreviewProvider {
    static var previews: some View {
        StepsGoalCardView(steps: 10000, showingEditView: .constant(false))
    }
}

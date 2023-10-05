//
//  CurrentStepsCardView.swift
//  Steps
//
//  Created by Brittany Rima on 12/28/22.
//

import SwiftUI

struct CurrentStepsCardView: View {
    let steps: Int

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .cornerRadius(12)
                .shadow(radius: 5)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(Constants.currentSteps)
                    Spacer()
                }

                HStack {
                    Text(String(format: Constants.enterSteps, steps))
                        .font(.system(size: 32))
                        .bold()

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
                .foregroundColor(.indigo)
                
                Spacer()
            }
            .padding()
        }
        .frame(width: 300, height: 80)
    }
}

struct CurrentStepsCardView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentStepsCardView(steps: 2000)
    }
}

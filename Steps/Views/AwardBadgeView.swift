//
//  AwardBadgeView.swift
//  Steps
//
//  Created by Brittany Rima on 12/16/22.
//

import SwiftUI

struct AwardBadgeView: View {
    let award: Award

    var body: some View {
        VStack {
            Image(systemName: award.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 100, height: 100)
                .overlay {
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 3))
                }

            // Add spinning effect on badge (like Apple Awards)
        }
    }
}

struct AwardBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardBadgeView(award: Award(name: "First Steps", description: "You got moving today. Way to go!", isUnlocked: false, image: "figure.walk"))
    }
}

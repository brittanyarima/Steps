//
//  AwardBadgeView.swift
//  Steps
//
//  Created by Brittany Rima on 12/16/22.
//

import SwiftUI

struct AwardBadgeView: View {
    let award: Award
    let isUnlocked: Bool

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
                .foregroundColor(isUnlocked ? .pink : .pink.opacity(0.2))
        }
        .padding()
    }
}

struct AwardBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardBadgeView(award: AwardData.awards[0], isUnlocked: true)
    }
}

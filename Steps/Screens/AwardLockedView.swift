//
//  AwardLockedView.swift
//  Steps
//
//  Created by Brittany Rima on 12/21/22.
//

import SwiftUI

struct AwardLockedView: View {
    var body: some View {
        VStack {
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.indigo)

            Text("Locked")
                .font(.title2)
                .bold()
                .foregroundColor(.indigo)

            Text("You haven't unlocked this award yet this week. Keep getting those steps in to unlock it. You can do it!")
                .foregroundColor(.secondary)
                .padding()
                .padding(.horizontal, 55)
                .multilineTextAlignment(.center)
        }
    }
}

struct AwardLockedView_Previews: PreviewProvider {
    static var previews: some View {
        AwardLockedView()
    }
}

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

            Text("Locked", comment: "Label title for locked")
                .font(.title2)
                .bold()
                .foregroundColor(.indigo)

            Text("You haven't unlocked this award yet this week. Keep getting those steps in and completing goals to unlock it. You can do it!", comment: "Description to guide user on how to unlock an award.")
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

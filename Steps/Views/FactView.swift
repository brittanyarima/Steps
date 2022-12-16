//
//  FactView.swift
//  Steps
//
//  Created by Brittany Rima on 12/16/22.
//

import SwiftUI

struct FactView: View {
    var body: some View {
        HStack {
            Image(systemName: "soccerball")
                .font(.title)
                .padding(.horizontal)
                .foregroundColor(.secondary)

            Text("You've walked about **2** soccer fields so far today. Keep it up!")

            Spacer()
        }
        .frame(width: 350)
        .padding(8)
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)

    }
}

struct FactView_Previews: PreviewProvider {
    static var previews: some View {
        FactView()
    }
}

// For every 144 Steps youve walked about 1 soccer field.

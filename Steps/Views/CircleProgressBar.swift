//
//  CircleProgressBar.swift
//  Steps
//
//  Created by Brittany Rima on 12/9/22.
//

import SwiftUI

struct CircleProgressBar: View {
    let value: Int
    let maxValue: Int

    var body: some View {
        ZStack {
            Circle()
                .stroke(.indigo.opacity(0.1), lineWidth: 10)

            Circle()
                .trim(from: 0, to: CGFloat(self.value) / CGFloat(self.maxValue))
                .stroke(.indigo, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(Angle(degrees: -90.0))

            VStack {
                Text("\(value)")
                    .font(.system(size: 82))

                Text("Szteps")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(value: 3022, maxValue: 10000)
    }
}

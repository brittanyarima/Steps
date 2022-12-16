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
                .stroke(.pink.opacity(0.1), lineWidth: 10)

            Circle()
                .trim(from: 0, to: CGFloat(self.value) / CGFloat(self.maxValue))
                .stroke(.pink, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(Angle(degrees: -90.0))

            VStack {
                Text("\(value)")
                    .font(.system(size: 40))

                Text("Steps")
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 200, height: 200)
        .padding()
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(value: 3022, maxValue: 10000)
    }
}

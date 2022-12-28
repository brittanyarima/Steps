//
//  CircleView.swift
//  Steps
//
//  Created by Brittany Rima on 12/28/22.
//

import SwiftUI

struct CircleView: View {
    let opacity: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 20)
                .foregroundColor(.indigo)

            Circle()
                .frame(width: 11)
                .opacity(opacity)
                .foregroundColor(.indigo)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(opacity: 0.2)
    }
}

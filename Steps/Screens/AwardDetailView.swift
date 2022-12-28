//
//  AwardDetailView.swift
//  Steps
//
//  Created by Brittany Rima on 12/21/22.
//

import SwiftUI

struct AwardDetailView: View {
    let award: Award
    @ObservedObject var viewModel: StepsViewModel
    @State private var rotationAngle: Angle = .degrees(0)

    var body: some View {
        VStack {
            BadgeImageView(award: award)
                .foregroundColor(.indigo)
                .rotation3DEffect(rotationAngle, axis: (x: 0, y: 360, z: 0))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.rotationAngle = Angle(degrees: value.translation.width)
                        }
                        .onEnded { _ in
                            withAnimation(.easeOut) {
                                self.rotationAngle = .degrees(0)
                            }
                        }
                )
                .animation(.interactiveSpring(), value: rotationAngle)

            Text(award.name)
                .font(.title2)
                .bold()
                .foregroundColor(.indigo)

            Text(award.description)
                .foregroundColor(.secondary)
                .padding()
                .padding(.horizontal, 55)
                .multilineTextAlignment(.center)
        }
    }
}

struct AwardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AwardDetailView(award: AwardData.awards[1], viewModel: StepsViewModel())
    }
}

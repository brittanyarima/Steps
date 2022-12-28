//
//  MountainView.swift
//  Steps
//
//  Created by Brittany Rima on 12/23/22.
//

import SwiftUI

struct MountainView: View {
    @ObservedObject var viewModel: StepsViewModel

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("background")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)

                VStack(spacing: 200) {
                    CircleView(opacity: 0.2)
                    CircleView(opacity: 0.2)
                    CircleView(opacity: 0.2)
                    CircleView(opacity: 0.2)
                }
                .offset(x: geo.size.width / 2 - 40)
                .padding(.bottom, 100)
                .padding(.top, 50)

//                Path { path in
//                    path.move(to: .init(x: geo.size.width / 2, y: geo.size.height + 20))
//                    path.addCurve(to: .init(x: geo.size.width / 2 + 80, y: geo.size.height - 300),
//                                  control1: .init(x: geo.size.width / 2, y: geo.size.height),
//                                  control2: .init(x: geo.size.width / 2 + 115, y: geo.size.height))
//                    path.addCurve(to: .init(x: geo.size.width, y: 0),
//                                  control1: .init(x: geo.size.width - 150, y: 300),
//                                  control2: .init(x: geo.size.width - 100, y: 200))
//                }
//                .stroke(Color.pink, lineWidth: 4)


            }
        }
    }
}

struct MountainView_Previews: PreviewProvider {
    static var previews: some View {
        MountainView(viewModel: StepsViewModel())
    }
}

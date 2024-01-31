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
                
                VStack(spacing: 200) {
                    CircleView(opacity: viewModel.checkPointFourReached ? 1 : 0.2)
                    CircleView(opacity: viewModel.checkPointThreeReached ? 1 : 0.2)
                    CircleView(opacity: viewModel.checkPointTwoReached ? 1 : 0.2)
                    CircleView(opacity: viewModel.checkPointOneReached ? 1: 0.2)
                }
                .offset(x: geo.size.width / 2 - 40)
                .padding(.bottom, 100)
                .padding(.top, 50)
                
                BackgroundView(stepsModel: viewModel)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)
            }
        }
    }
}

struct MountainView_Previews: PreviewProvider {
    static var previews: some View {
        MountainView(viewModel: StepsViewModel())
    }
}

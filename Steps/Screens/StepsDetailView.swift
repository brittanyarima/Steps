//
//  StepsDetailView.swift
//  Steps
//
//  Created by Brittany Rima on 12/14/22.
//

import SwiftUI

struct StepsDetailView: View {
    @ObservedObject var viewModel: StepsViewModel

    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                FactView(viewModel: viewModel)
                CircleProgressBar(value: viewModel.currentSteps, maxValue: viewModel.goal)
                    .padding()
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2), content: {
                    StepsDetailCardView(title: Constants.caloriesBurned, image: "flame.fill", value: "\(viewModel.currentCalories) kcal")
                    StepsDetailCardView(title: Constants.distance, image: "figure.walk", value: "\(viewModel.currentDistance) metre")
                }).padding(.horizontal)
                Spacer()
            }
            .padding(.top, 30)
        }
    }
}

struct StepsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StepsDetailView(viewModel: StepsViewModel())
    }
}


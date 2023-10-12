//
//  ContentView.swift
//  Steps
//
//  Created by Brittany Rima on 12/6/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: StepsViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                MountainView(viewModel: viewModel)
                    .edgesIgnoringSafeArea(.all)
                
                NavigationLink {
                    StepsDetailView(viewModel: viewModel)
                } label: {
                    VStack {
                        Spacer()
                        HStack {
                            CurrentStepsCardView(steps: viewModel.currentSteps)
                            Spacer()
                        }
                        .padding()
                        Spacer()
                    }
                    .padding(.bottom, 100)
                }
            }
            .onAppear {
                viewModel.requestAuthorization { isSuccess in
                    if isSuccess == true {
                        viewModel.calculateSteps { statsCollection in
                            if let statsCollection = statsCollection {
                                viewModel.updateUIFromStats(statsCollection)
                            }
                        }
                        viewModel.calculateLastWeeksSteps { statsCollection in
                            if let statsCollection = statsCollection {
                                viewModel.updateWeekUIFromStats(statsCollection)
                            }
                        }
                        viewModel.calculateMonthSteps { statsCollection in
                            if let statsCollection = statsCollection {
                                viewModel.updateMonthUIFromStats(statsCollection)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: StepsViewModel())
    }
}

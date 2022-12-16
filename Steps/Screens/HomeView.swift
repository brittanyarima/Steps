//
//  ContentView.swift
//  Steps
//
//  Created by Brittany Rima on 12/6/22.
//

import SwiftUI
import Charts


struct HomeView: View {
    @StateObject var viewModel = StepsViewModel()

    var body: some View {
        NavigationStack {
            VStack {

                NavigationLink {
                    StepsDetailView(viewModel: viewModel)
                } label: {
                    Text("Current Steps: \(viewModel.currentSteps)")
                }

            }
            .navigationTitle("🏃 Steps")
            .onAppear {
                viewModel.requestAuthorization { success in
                    if success {
                        viewModel.calculateSteps { statsCollection in
                            if let statsCollection = statsCollection {
                                // update UI
                                viewModel.updateUIFromStats(statsCollection)
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
        HomeView()
    }
}

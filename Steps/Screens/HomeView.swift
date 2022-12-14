//
//  ContentView.swift
//  Steps
//
//  Created by Brittany Rima on 12/6/22.
//

import SwiftUI


struct HomeView: View {
    @StateObject var viewModel = StepsViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    
                } label: {
                    Text("Steps: \(viewModel.steps)")
                        .padding()
                        .background(.tertiary)
                }
            }
            .navigationTitle("🏃 Steps")
            .onAppear(perform: viewModel.loadSteps)
        }
    }


}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

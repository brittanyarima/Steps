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
        VStack {
            // fun fact
            WeekStepsView(viewModel: viewModel)
        }
    }
}

struct StepsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StepsDetailView(viewModel: StepsViewModel())
    }
}

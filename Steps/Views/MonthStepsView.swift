//
//  MonthStepsView.swift
//  Steps
//
//  Created by Mohd Wasif Raza on 04/10/23.
//


import SwiftUI
import Charts

struct MonthStepsView: View {
    @ObservedObject var viewModel: StepsViewModel

    var body: some View {
        VStack {
        }
    }
}

struct MonthStepsView_Previews: PreviewProvider {
    static var previews: some View {
        MonthStepsView(viewModel: StepsViewModel())
    }
}

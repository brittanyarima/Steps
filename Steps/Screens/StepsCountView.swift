//
//  StepsCountView.swift
//  Steps
//
//  Created by Mohd Wasif Raza on 04/10/23.
//

import SwiftUI

struct StepsCountView: View {
    @ObservedObject var viewModel: StepsViewModel
    @State private var selectedTab = TextConstants.week.value

    var body: some View {
        VStack(spacing: 20) {
            GoalPickerView(selectedTab: $selectedTab)
            
            if selectedTab == TextConstants.week.value {
                NewWeekStepsView(viewModel: viewModel)
            }
            else {
                MonthStepsView(viewModel: viewModel)
            }
            Spacer()
        
        }
        .padding(.top, 30)
    }
}

struct StepsCountView_Previews: PreviewProvider {
    static var previews: some View {
        StepsCountView(viewModel: StepsViewModel())
    }
}

//MARK: - SUPPORTING VIEWS

fileprivate struct GoalPickerView: View {
    @Binding var selectedTab: String
    let tabOptions = [TextConstants.week.value, TextConstants.month.value]

    var body: some View {
        Picker(TextConstants.goalsTitle.value, selection: $selectedTab) {
            ForEach(tabOptions, id: \.self) { tab in
                Text(tab)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

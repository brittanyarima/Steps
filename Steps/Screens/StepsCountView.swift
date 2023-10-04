//
//  StepsCountView.swift
//  Steps
//
//  Created by Mohd Wasif Raza on 04/10/23.
//

import SwiftUI

struct StepsCountView: View {
    @ObservedObject var viewModel: StepsViewModel
    @State private var selectedTab = "Week"

    var body: some View {
        VStack(spacing: 20) {
            TaskPickerView(selectedTab: $selectedTab)
            
            if selectedTab == "Week" {
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

fileprivate struct TaskPickerView: View {
    @Binding var selectedTab: String
    let tabOptions = ["Week", "Month"]

    var body: some View {
        Picker("Goals", selection: $selectedTab) {
            ForEach(tabOptions, id: \.self) { tab in
                Text(tab)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

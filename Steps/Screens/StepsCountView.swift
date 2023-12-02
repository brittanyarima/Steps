////
////  StepsCountView.swift
////  Steps
////
////  Created by Mohd Wasif Raza on 04/10/23.
////
//
//import SwiftUI
//
//struct StepsCountView: View {
//    @ObservedObject var viewModel: StepsViewModel
//    @State private var selectedTab = Constants.week
//
//    var body: some View {
//        VStack(spacing: 20) {
//            GoalPickerView(selectedTab: $selectedTab)
//            
//            if selectedTab == Constants.week {
//                NewWeekStepsView(viewModel: viewModel)
//            }
//            else {
//                MonthStepsView(viewModel: viewModel)
//            }
//            Spacer()
//        
//        }
//        .padding(.top, 30)
//    }
//}
//
//struct StepsCountView_Previews: PreviewProvider {
//    static var previews: some View {
//        StepsCountView(viewModel: StepsViewModel())
//    }
//}
//
////MARK: - SUPPORTING VIEWS
//
//fileprivate struct GoalPickerView: View {
//    @Binding var selectedTab: String
//    let tabOptions = [Constants.week, Constants.month]
//
//    var body: some View {
//        Picker(Constants.goalsTitle, selection: $selectedTab) {
//            ForEach(tabOptions, id: \.self) { tab in
//                Text(tab)
//            }
//        }
//        .pickerStyle(.segmented)
//        .padding()
//    }
//}

//
//  MainView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var stepsViewModel = StepsViewModel()
    
    var body: some View {
        TabView {
            HomeView(viewModel: stepsViewModel)
                .tabItem {
                    Label(TextConstants.homeTab.value, systemImage: "house")
                }
            
            GoalView(viewModel: .init())
                .tabItem {
                    Label(TextConstants.goalsTab.value, systemImage: "checklist")
                }
            
            AwardView(viewModel: stepsViewModel)
                .tabItem {
                    Label(TextConstants.awardsTab.value, systemImage: "trophy")
                }
            
            StepsCountView(viewModel: stepsViewModel)
                .tabItem {
                    Label(TextConstants.stepsTab.value, systemImage: "chart.bar")
                }
            
            SettingsView(stepsViewModel: stepsViewModel)
                .tabItem {
                    Label(TextConstants.settingsTab.value, systemImage: "slider.vertical.3")
                }
        }
        .tint(.indigo)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

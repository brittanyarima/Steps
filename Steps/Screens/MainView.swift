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
                    Label("Home", systemImage: "house")
                }

            AwardView(viewModel: stepsViewModel)
                .tabItem {
                    Label("Awards", systemImage: "trophy")
                }

            SettingsView(stepsViewModel: stepsViewModel)
                .tabItem {
                    Label("Settings", systemImage: "slider.vertical.3")
                }
        }
        .tint(.mint)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

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
                    Label {
                        Text("Home", comment: "Home tab title")
                    } icon: {
                        Image(systemName: "house")
                    }
                }
            
            TaskView()
                .tabItem {
                    Label {
                        Text("Goals", comment: "Goals tab title")
                    } icon: {
                        Image(systemName: "checklist")
                    }
                }
            
            AwardView(viewModel: stepsViewModel)
                .tabItem {
                    Label {
                        Text("Awards", comment: "Awards tab title")
                    } icon: {
                        Image(systemName: "trophy")
                    }
                }
            
            SettingsView(stepsViewModel: stepsViewModel)
                .tabItem {
                    Label {
                        Text("Settings", comment: "Settings tab title")
                    } icon: {
                        Image(systemName: "slider.vertical.3")
                    }
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

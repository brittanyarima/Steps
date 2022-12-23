//
//  SettingsView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    @ObservedObject var stepsViewModel: StepsViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                StepsGoalCardView(steps: stepsViewModel.goal, showingEditView: $viewModel.showingEditView)
                    .padding()

                Form {
                    Section {
                        Toggle("Notifications", isOn: $viewModel.notificationsOn)
                    } header: {
                        Label("Notification settings", systemImage: "bell")
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .padding()
            .padding(.vertical, 20)
            .sheet(isPresented: $viewModel.showingEditView, content: {
                EditStepsGoalView(goal: $stepsViewModel.goal)
                    .presentationDetents([.height(200)])
            })
            .onChange(of: viewModel.notificationsOn, perform: { _ in
                if viewModel.notificationsOn {
                    viewModel.requestNotificationAuth()
                }
            })
            .navigationTitle("⚙️ Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(stepsViewModel: StepsViewModel())
    }
}



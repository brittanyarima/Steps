//
//  SettingsView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                StepsGoalCardView(steps: 10000, showingEditView: $viewModel.showingEditView)
                    .padding()

                Form {
                    Section {
                        Toggle("Notifications", isOn: $viewModel.notificationsOn)

                        if viewModel.notificationsOn {
                            Toggle("Goal Reminders", isOn: $viewModel.remindersOn)
                            Toggle("Achievements Reached", isOn: $viewModel.goalCompletionNotificationOn)
                        }
                    } header: {
                        Label("Notification settings", systemImage: "bell")
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .padding()
            .padding(.vertical, 20)
            .sheet(isPresented: $viewModel.showingEditView, content: {
                EditStepsGoalView()
                    .presentationDetents([.height(200)])
            })
            .navigationTitle("⚙️ Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}



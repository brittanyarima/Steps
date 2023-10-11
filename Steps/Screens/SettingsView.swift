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
                        Toggle(isOn: $viewModel.notificationsOn) {
                            Text("Notifications", comment: "Link to toggle notifications")
                        }
                    } header: {
                        Label {
                            Text("Notification settings", comment: "Notification settings section title")
                        } icon: {
                            Image(systemName: "bell")
                        }
                    }
                    
                    Link(destination: URL(string: Constants.termsURL)!) {
                        Text("Terms of Use", comment: "Link to terms of use")
                    }
                    
                    Link(destination: URL(string: Constants.privacyURL)!) {
                        Text("Privacy Policy", comment: "Link to privacy policy")
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .padding()
            .padding(.vertical, 20)
            .sheet(isPresented: $viewModel.showingEditView, content: {
                EditStepsGoalView(goal: $stepsViewModel.goal)
                    .presentationDetents([.height(250)])
            })
            .onChange(of: viewModel.notificationsOn, perform: { _ in
                viewModel.requestNotificationAuth()
            })
            .navigationTitle(Text("⚙️ Settings", comment: "Settings navigation title"))
            .tint(.indigo)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(stepsViewModel: StepsViewModel())
    }
}

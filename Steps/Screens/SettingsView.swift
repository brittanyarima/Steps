//
//  SettingsView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI
import UserNotifications
import PhotosUI

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
                        Toggle(Constants.notifications, isOn: $viewModel.notificationsOn)
                    } header: {
                        Label(Constants.notificationSettings, systemImage: "bell")
                    }
                    
                    Section {
                        if stepsViewModel.backgroundImage != nil {
                            Button("Reset background image") {
                                stepsViewModel.backgroundImageSelection = nil
                            }
                            .buttonStyle(.borderless)
                        } else {
                            PhotosPicker(selection: $stepsViewModel.backgroundImageSelection,
                                         matching: .images,
                                         photoLibrary: .shared()) {
                                Text("Set background image")
                            }
                            .buttonStyle(.borderless)
                        }
                    } header: {
                        Label("Home Screen", systemImage: "iphone.gen3")
                    }

                    Link(Constants.termsOfUse, destination: URL(string: Constants.termsURL)!)
                    Link(Constants.privacyPolicy, destination: URL(string: Constants.privacyURL)!)

                    Button {
                        viewModel.showContributors = true
                    } label: {
                        Text("Contributors")
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
            .sheet(isPresented: $viewModel.showContributors, content: {
                NavigationStack {
                    ContributorsView()
                }
            })
            .task(id: viewModel.notificationsOn) {
                await viewModel.requestNotificationAuth()
            }
            .navigationTitle("⚙️ \(Constants.settingsTitle)")
            .tint(.indigo)
        }
        .alert(isPresented: $stepsViewModel.showBackgroundImageAlert) {
            Alert(title: Text("Failed to set background image."),
                              message: Text("Please choose another image."))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(stepsViewModel: StepsViewModel())
    }
}

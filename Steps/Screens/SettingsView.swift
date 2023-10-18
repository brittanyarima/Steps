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
                        Toggle(TextConstants.notifications.value, isOn: $viewModel.notificationsOn)
                    } header: {
                        Label(TextConstants.notificationSettings.value, systemImage: "bell")
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
                    
                    Link(TextConstants.termsOfUse.value, destination: URL(string: Constants.termsURL)!)
                    Link(TextConstants.privacyPolicy.value, destination: URL(string: Constants.privacyURL)!)
                    
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
            .onChange(of: viewModel.notificationsOn, perform: { _ in
                viewModel.requestNotificationAuth()
            })
            .navigationTitle(TextConstants.settingsTitle.value)
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

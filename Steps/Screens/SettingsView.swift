//
//  SettingsView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI
import RevenueCat
import UserNotifications

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    @ObservedObject var stepsViewModel: StepsViewModel
    @EnvironmentObject var userViewModel: UserViewModel

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

                    SubscriptionSettingsView(
                        userIsSubscribed: userViewModel.isSubscriptionActive,
                        subscriptionType: userViewModel.isSubscriptionActive ? "Pro" : "Free")

                    Button {
                        // Restore Purchases
                        Purchases.shared.restorePurchases { customerInfo, error in
                            //... check customerInfo to see if entitlement is now active
                            userViewModel.isSubscriptionActive = customerInfo?.entitlements.all["pro"]?.isActive == true
                        }
                    } label: {
                        Text("Restore Purchases")
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
            .navigationTitle("⚙️ Settings")
            .tint(.indigo)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(stepsViewModel: StepsViewModel())
            .environmentObject(UserViewModel())
    }
}

fileprivate struct SubscriptionSettingsView: View {
    var userIsSubscribed: Bool
    let subscriptionType: String

    var body: some View {
        Section {
            HStack {
                Text("Subscription Status:")
                    .bold()
                Text(subscriptionType)
            }

            if !userIsSubscribed {
                NavigationLink {
                    PaywallView()
                } label: {
                    Text("Signup for StepTracker+")
                }
            } else {
                Link(destination: URL(string: Constants.subcriptionSettingsURL)!) {
                    Text("Manage Subscription")
                }
            }
        } header: {
            Label("Subscription Settings", systemImage: "star.circle.fill")
        }
    }
}

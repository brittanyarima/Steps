//
//  PaywallView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI
import RevenueCat

struct PaywallView: View {
    @State var currentOffering: Offering?
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("StepTracker")
                .bold()
                .font(.largeTitle)
            +
            Text("+")
                .bold()
                .font(.system(size: 40))
                .foregroundColor(.indigo)

            Text("Unlock more features with StepTracker+")

            Spacer()

            VStack {
                Image(systemName: "figure.walk.motion")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundColor(.indigo)

                PaywallLabelView(image: "chart.bar.xaxis",
                                 title: "Charts & Graphs",
                                 detailText: "Graphs that visualize your weekly steps progress.")
                PaywallLabelView(image: "checklist", title: "Custom Goals", detailText: "Set and keep track of your own personal steps and activity goals.")

                PaywallLabelView(image: "trophy.fill", title: "Unlock Awards", detailText: "Stay motivated by unlocking awards for working towards your steps goal.")

                Spacer()

                if currentOffering != nil {

                    ForEach(currentOffering!.availablePackages) { pkg in
                        Button {
                            // BUY
                            Purchases.shared.purchase(package: pkg) { (transaction, customerInfo, error, userCancelled) in

                                if customerInfo!.entitlements.all["pro"]?.isActive == true {
                                    // Unlock that great "pro" content
                                    userViewModel.isSubscriptionActive = true
                                    //                                        isPaywallPresented = false  // dismisses view
                                }
                            }
                        } label: {
                            Text("\(pkg.storeProduct.subscriptionPeriod!.periodTitle) \(pkg.storeProduct.localizedPriceString)")
                        }
                        .buttonStyle(.bordered)
                        .tint(.indigo)
                    }
                }

                Spacer()

                Text("More steps and greater motivation")
            }
        }
        .onAppear {
            Purchases.shared.getOfferings { offerings, error in
                if let offer = offerings?.current, error == nil {
                    currentOffering = offer
                }
            }
        }
    }
}

struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}

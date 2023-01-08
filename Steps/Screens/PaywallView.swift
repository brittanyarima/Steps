//
//  PaywallView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI
import RevenueCat

struct PaywallView: View {
    @Binding var isPaywallPresented: Bool
    @State var currentOffering: Offering?

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

            Text("Unlock weekly steps details, keep track of your goals, and win awards")

            Spacer()

            VStack(spacing: 40) {
                Label("Graphs that show your weekly progress", systemImage: "chart.bar.xaxis")
                Label("Create and track your steps goals", systemImage: "checklist")
                Label("Weekly awards to keep you motivated", systemImage: "trophy")
            }
            Spacer()

            if currentOffering != nil {

                ForEach(currentOffering!.availablePackages) { pkg in
                    Button {
                        // BUY
                    } label: {
                        Text("\(pkg.storeProduct.subscriptionPeriod.un)")
                    }
                    .buttonStyle(.bordered)
                    .tint(.indigo)
                }
            }



            Spacer()

            Text("More steps and greater motivation")
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
        PaywallView(isPaywallPresented: .constant(true))
    }
}

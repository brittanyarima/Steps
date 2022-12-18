//
//  SettingsView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI

struct SettingsView: View {
    @State private var showingEditView = false
    var body: some View {
        NavigationStack {
            VStack {
                StepsGoalCardView(steps: 10000, showingEditView: $showingEditView)
                    .padding()

            }
            .sheet(isPresented: $showingEditView, content: {
                EditStepsGoalView()
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



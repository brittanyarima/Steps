//
//  BadgeView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI

struct AwardView: View {
    @ObservedObject var viewModel: StepsViewModel
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 150, maximum: 150))]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Can you can unlock all of these awards this week?")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding()

                LazyVGrid(columns: columns) {
                    ForEach(AwardData.awards, id: \.name) { award in
                        AwardBadgeView(award: award, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("🏆 Weekly Awards")
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView(viewModel: StepsViewModel())
    }
}

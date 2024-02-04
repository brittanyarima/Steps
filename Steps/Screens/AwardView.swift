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
                Text(Constants.unlockAwardsDesc)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding()

                LazyVGrid(columns: columns) {
                    ForEach(Award.allCases, id: \.name) { award in
                        AwardBadgeView(award: award, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("🏆 \(Constants.weeklyAwards)")
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView(viewModel: StepsViewModel())
    }
}

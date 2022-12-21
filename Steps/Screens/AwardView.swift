//
//  BadgeView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI

struct AwardView: View {
    @ObservedObject var viewModel = StepsViewModel()

    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 100, maximum: 100))]
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {

                    ForEach(AwardData.awards, id: \.name) { award in
                        AwardBadgeView(award: award, isUnlocked: award.isUnlocked)
                    }
                }
            }
            .navigationTitle("🏆 Awards")
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView()
    }
}

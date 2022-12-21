//
//  BadgeView.swift
//  Steps
//
//  Created by Brittany Rima on 12/13/22.
//

import SwiftUI

struct AwardView: View {
    @StateObject var viewModel = StepsViewModel()

    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 150, maximum: 150))]
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {

                    ForEach(AwardData.awards, id: \.name) { award in
                        NavigationLink {
                            AwardDetailView(award: award)
                        } label: {
                            AwardBadgeView(award: award, viewModel: viewModel)
                        }
                    }
                }
            }
            .navigationTitle("🏆 Daily Awards")
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView()
    }
}

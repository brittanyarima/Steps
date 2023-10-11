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
                Text("Can you can unlock all of these awards this week?", comment: "Asks a user if they can unlock awards")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding()

                LazyVGrid(columns: columns) {
                    ForEach(AwardData.awards, id: \.name) { award in
                        AwardBadgeView(award: award, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle(Text("🏆 Weekly Awards", comment: "Awards navigation title"))
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView(viewModel: StepsViewModel())
    }
}

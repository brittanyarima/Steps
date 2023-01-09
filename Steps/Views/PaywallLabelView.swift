//
//  PaywallLabelView.swift
//  Steps
//
//  Created by Brittany Rima on 1/8/23.
//

import SwiftUI

struct PaywallLabelView: View {
    let image: String
    let title: String
    let detailText: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(.indigo)
                .padding(.trailing, 5)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .bold()

                Text(detailText)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.vertical)
    }
}

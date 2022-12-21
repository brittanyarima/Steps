//
//  BadgeImageView.swift
//  Steps
//
//  Created by Brittany Rima on 12/21/22.
//

import SwiftUI

struct BadgeImageView: View {
    let award: Award

    var body: some View {
        Image(systemName: award.image)
            .resizable()
            .scaledToFit()
            .padding()
            .frame(width: 100, height: 100)
            .overlay {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 3))
            }
    }
}

struct BadgeImageView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeImageView(award: AwardData.awards[0])
    }
}

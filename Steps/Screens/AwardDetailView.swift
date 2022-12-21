//
//  AwardDetailView.swift
//  Steps
//
//  Created by Brittany Rima on 12/21/22.
//

import SwiftUI

struct AwardDetailView: View {
    let award: Award

    var body: some View {
        Text(award.name)
    }
}

struct AwardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AwardDetailView(award: AwardData.awards[1])
    }
}

//
//  FactView.swift
//  Steps
//
//  Created by Brittany Rima on 12/16/22.
//

import SwiftUI

struct FactView: View {
    @ObservedObject var viewModel: StepsViewModel

    var body: some View {
        HStack {
            Image(systemName: "soccerball")
                .font(.title)
                .padding(.horizontal, 2)
                .foregroundColor(.secondary)

            Text(viewModel.soccerFieldsWalkedString)
                .font(.footnote)
                .fontWeight(.light)

            Spacer()
        }
        .frame(width: 300)
        .padding()
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)
    }
}

struct FactView_Previews: PreviewProvider {
    static var previews: some View {
        FactView(viewModel: StepsViewModel())
    }
}

//
//  BackgroundView.swift
//  Steps
//
//  Created by Raphael on 04.10.23.
//

import SwiftUI

struct BackgroundView: View {
    @ObservedObject var stepsModel: StepsViewModel

    var body: some View {
        if let backgroundImage = stepsModel.backgroundImage {
            Image(uiImage: backgroundImage)
                .resizable()
        } else {
            Image("background")
                .resizable()
        }
    }
}

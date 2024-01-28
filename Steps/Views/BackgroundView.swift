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
        GeometryReader { geo in
            if let backgroundImage = stepsModel.backgroundImage {
                Image(uiImage: backgroundImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
            } else {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
            }
        }
    }
}

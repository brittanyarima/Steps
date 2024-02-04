
//
//  ContributorsView.swift
//  Steps
//
//  Created by Drag0ndust on 05.10.23.
//

import SwiftUI

struct ContributorsView: View {
    @Environment(\.openURL) private var openURL
    @Environment(\.dismiss) private var dismiss

    @StateObject var viewModel = ContributorsViewModel()

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]

    var body: some View {
        Group {
            if !viewModel.contributors.isEmpty {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.contributors) { element in
                            VStack {
                                AsyncImage(url: URL(string: element.avatarURL)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 20))

                                Text(element.login)
                                    .font(.caption)
                            }
                            .onTapGesture {
                                openURL(URL(string: element.htmlURL)!)
                            }
                        }
                    }
                    .padding()
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Contributors")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "xmark")
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        .task {
            await viewModel.fetchContributors()
        }
    }
}

#Preview {
    NavigationStack {
        ContributorsView()
    }
}

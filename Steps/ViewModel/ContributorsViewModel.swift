
//
//  ContributorsViewModel.swift
//  Steps
//
//  Created by Drag0ndust on 05.10.23.
//

import Foundation

class ContributorsViewModel: ObservableObject {
    @Published var contributors: [Contributor] = []

    func fetchContributors() async {
        guard let url = URL(string: "https://api.github.com/repos/brittanyarima/Steps/contributors") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let contributors = try JSONDecoder().decode([Contributor].self, from: data)

            await MainActor.run {
                self.contributors = contributors
            }
        } catch {
            print("❗️ Error laoding contributors from Github API: \(error.localizedDescription)")
        }
    }
}

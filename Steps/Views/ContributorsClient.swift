//
//  ContributorsClient.swift
//  Steps
//
//  Created by Daniel Lyons on 10/6/23.
//

import Foundation
import Dependencies

struct ContributorsClient {

    /// A closure that asynchronously fetches a Contributors
    var fetchContributors: () async -> [Contributor]
}

// MARK: Live Dependency Key
extension ContributorsClient: DependencyKey {

    /// A live value of `ContributorsClient` for
    static let liveValue = ContributorsClient(
        fetchContributors: {
            guard let url = URL(string: "https://api.github.com/repos/brittanyarima/Steps/contributors") else { return [] }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let contributors = try JSONDecoder().decode([Contributor].self, from: data)

                return contributors
            } catch {
                print("❗️ Error laoding contributors from Github API: \(error.localizedDescription)")
                return []
            }
        }
    )
}



// MARK: Test Dependency Key
extension ContributorsClient: TestDependencyKey {
    /// A preview instance of `ContributorsClient` which by default will be used in Xcode Previews
    static let previewValue = ContributorsClient.liveValue
    // It should be safe to use the live value in previews for now since the client can only fetch, not write.

    /// A test instance of `ContributorsClient` which by default will be used in XCTests
    static let testValue: Self = .init(
        fetchContributors: {
            return [Contributor].mock
        }
    )
}

// MARK: Dependency Values
extension DependencyValues {
    var contributors: ContributorsClient {
        get { self[ContributorsClient.self] }
        set { self[ContributorsClient.self] = newValue }
    }
}

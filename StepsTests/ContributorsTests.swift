//
//  ContributorsTests.swift
//  StepsTests
//
//  Created by Daniel Lyons on 10/6/23.
//

import XCTest
import Dependencies
@testable import Steps

@MainActor
final class ContributorsTests: XCTestCase {
    func testFetchContributors() async {
        let vm = ContributorsViewModel()
        
        await vm.fetchContributors()
        XCTAssertEqual(vm.contributors, [Contributor].mock)
    }
}

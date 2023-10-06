//
//  ContributorsViewModel.swift
//  Steps
//
//  Created by Drag0ndust on 05.10.23.
//

import Foundation
import Dependencies

class ContributorsViewModel: ObservableObject {
    @Published var contributors: [Contributor] = []
    
    @Dependency(\.contributors) var contributorsClient
    
    func fetchContributors() async {
        self.contributors = await self.contributorsClient.fetchContributors()
    }
}




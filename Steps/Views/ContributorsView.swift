//
//  ContributorsView.swift
//  Steps
//
//  Created by Drag0ndust on 05.10.23.
//

import SwiftUI

struct ContributorsView: View {
    @StateObject var viewModel = ContributorsViewModel() 
    
    var body: some View {
        Text("Contributors View")
    }
}

#Preview {
    ContributorsView()
}

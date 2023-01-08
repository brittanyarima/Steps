//
//  AwardBadgeView.swift
//  Steps
//
//  Created by Brittany Rima on 12/16/22.
//

import SwiftUI

struct AwardBadgeView: View {
    let award: Award
    @ObservedObject var viewModel: StepsViewModel
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: []) var tasks: FetchedResults<Task>

    var isAwardUnlocked: Bool {
        switch award.name {
        case "First Steps":
            return viewModel.steps.contains { $0.count > 100 }
        case "Gooooaaaaal":
            return viewModel.steps.contains { $0.count >= viewModel.goal }
        case "Double Trouble":
            return viewModel.steps.contains { $0.count >= (viewModel.goal * 2)}
        case "Threes":
            return viewModel.steps.contains { $0.count >= (viewModel.goal * 3)}
        case "Perfect Week":
            if viewModel.steps.count == 0 { return false }
            return viewModel.steps.allSatisfy { $0.count > viewModel.goal }
        case "Don't Messi With You":
            return viewModel.steps.contains { $0.count >= 14400 } // about 100 soccer fields
        case "Motivated":
            return tasks.count > 1
        case "First Goal!":
            return tasks.count > 1 && tasks.last?.isComplete == true
        case "Dreamer":
            return tasks.count > 4
        case "Go Getter":
            var completed = 0
            for task in tasks {
                if task.isComplete {
                    completed += 1
                }
            }
            return completed > 4
        default:
            return false
        }
    }

    var body: some View {
        VStack {
            NavigationLink {
                if isAwardUnlocked {
                    AwardDetailView(award: award, viewModel: viewModel)
                } else { AwardLockedView() }
            } label: {
                VStack {
                    BadgeImageView(award: award)
                        .foregroundColor(isAwardUnlocked ? .indigo : .indigo.opacity(0.2))
                }
                .padding()
            }
        }
    }
}

struct AwardBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        AwardBadgeView(award: AwardData.awards[4], viewModel: StepsViewModel())
    }
}

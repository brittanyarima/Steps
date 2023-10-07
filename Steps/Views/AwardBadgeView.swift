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
        switch award {
        case .firstStep:
            return viewModel.steps.contains { $0.count > 100 }
        case .goal:
            return viewModel.steps.contains { $0.count >= viewModel.goal }
        case .doubleTrouble:
            return viewModel.steps.contains { $0.count >= (viewModel.goal * 2)}
        case .threes:
            return viewModel.steps.contains { $0.count >= (viewModel.goal * 3)}
        case .perfectweek:
            if viewModel.steps.count == 0 { return false }
            return viewModel.steps.allSatisfy { $0.count > viewModel.goal }
        case .messi:
            return viewModel.steps.contains { $0.count >= 14400 } // about 100 soccer fields
        case .motivated:
            return tasks.count > 1
        case .firstGoal:
            return tasks.count > 1 && tasks.last?.isComplete == true
        case .dreamerGoal:
            return tasks.count > 4
        case .goGetter:
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
        AwardBadgeView(award: .perfectweek, viewModel: StepsViewModel())
    }
}

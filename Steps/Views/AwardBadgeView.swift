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
        entity: Goal.entity(),
        sortDescriptors: []) var goals: FetchedResults<Goal>

    var isAwardUnlocked: Bool {
        switch award.name {
        case TextConstants.firstStepsName.value:
            return viewModel.steps.contains { $0.count > 100 }
        case TextConstants.goalName.value:
            return viewModel.steps.contains { $0.count >= viewModel.goal }
        case TextConstants.doubleTroubleName.value:
            return viewModel.steps.contains { $0.count >= (viewModel.goal * 2)}
        case TextConstants.threesName.value:
            return viewModel.steps.contains { $0.count >= (viewModel.goal * 3)}
        case TextConstants.perfectWeekName.value:
            if viewModel.steps.count == 0 { return false }
            return viewModel.steps.allSatisfy { $0.count > viewModel.goal }
        case TextConstants.messiName.value:
            return viewModel.steps.contains { $0.count >= 14400 } // about 100 soccer fields
        case TextConstants.motivatedName.value:
            return goals.count > 1
        case TextConstants.firstGoalName.value:
            return goals.count > 1 && goals.last?.isComplete == true
        case TextConstants.dreamerGoalName.value:
            return goals.count > 4
        case TextConstants.goGetterName.value:
            var completed = 0
            for goal in goals {
                if goal.isComplete {
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

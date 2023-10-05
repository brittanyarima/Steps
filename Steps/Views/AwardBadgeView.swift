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
        case Constants.firstStepsName:
            return viewModel.steps.contains { $0.count > 100 }
        case Constants.goalName:
            return viewModel.steps.contains { $0.count >= viewModel.goal }
        case Constants.doubleTroubleName:
            return viewModel.steps.contains { $0.count >= (viewModel.goal * 2)}
        case Constants.threesName:
            return viewModel.steps.contains { $0.count >= (viewModel.goal * 3)}
        case Constants.perfectWeekName:
            if viewModel.steps.count == 0 { return false }
            return viewModel.steps.allSatisfy { $0.count > viewModel.goal }
        case Constants.messiName:
            return viewModel.steps.contains { $0.count >= 14400 } // about 100 soccer fields
        case Constants.motivatedName:
            return tasks.count > 1
        case Constants.firstGoalName:
            return tasks.count > 1 && tasks.last?.isComplete == true
        case Constants.dreamerGoalName:
            return tasks.count > 4
        case Constants.goGetterName:
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

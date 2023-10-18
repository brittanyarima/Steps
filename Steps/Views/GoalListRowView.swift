//
//  GoalListRowView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import CoreData
import SwiftUI

struct GoalListRowView: View {
    @ObservedObject var goal: Goal

    var body: some View {
        HStack {
            Text(goal.name ?? TextConstants.unknownName.value)
            Spacer()
            if goal.isComplete {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.indigo)
                    .rotationEffect(.degrees(0))
                    .opacity(1)
                    .scaleEffect(1)
                    .animation(
                        Animation.easeInOut(duration: 0.6)
                            .repeatCount(1, autoreverses: false),
                        value: goal.isComplete
                    )
                    .onTapGesture {
                        toggleGoal()
                    }
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.indigo)
                    .onTapGesture {
                        toggleGoal()
                    }
            }
        }

        .font(.title3)
        .padding()
        .background(.indigo.opacity(0.2))
        .foregroundColor(.indigo)
        .fontWeight(.medium)
        .cornerRadius(12)
        .multilineTextAlignment(.leading)
    }
    
    private func toggleGoal() {
        withAnimation {
            goal.isComplete.toggle()
            if goal.hasChanges {
                PersistenceController.shared.save()
            }
        }
    }
}

struct GoalListRowView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let goal = Goal(context: moc)
        GoalListRowView(goal: goal)
    }
}

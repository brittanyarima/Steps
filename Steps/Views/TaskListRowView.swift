//
//  TaskListRowView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI

struct TaskListRowView: View {
    @ObservedObject var task: Task

    var body: some View {
        HStack {
            Text(task.name ?? "Unknown Name")
            Spacer()
            Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                .onTapGesture {
                    task.isComplete.toggle()
                    if task.hasChanges {
                        PersistenceController.shared.save()
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
}

//
//  TaskListRowView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI

struct TaskListRowView: View {
    @ObservedObject var task: Task
    @State private var completeGoal = false

    var body: some View {
        HStack {
            Text(task.name ?? "Unknown Name")
            Spacer()
            Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                .onTapGesture {
                    completeGoal.toggle()
                }
                .alert("Complete", isPresented: $completeGoal) {
                    Button("Complete Goal") {
                        task.isComplete.toggle()
                        if task.hasChanges {
                            PersistenceController.shared.save()
                        }
                    }
                    Button("Cancel", role: .cancel) { }
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

//
//  TaskListRowView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI

struct TaskListRowView: View {
    @State private var isCompleted: Bool = false
    let task: Task

    var body: some View {
        HStack {
            Text(task.name ?? "Unknown Name")
            Spacer()
            Image(systemName: isCompleted ? "checkmark.circle" : "circle")
                .onTapGesture {
                    isCompleted.toggle()
                }
        }
        .font(.title2)
        .padding()
        .background(.indigo.opacity(0.2))
        .foregroundColor(.indigo)
        .fontWeight(.semibold)
        .cornerRadius(12)
        .padding()
        .alert(isPresented: $isCompleted) {
            Alert(title: Text("Complete Task?"),
                  primaryButton: .default(Text("Complete")) {
                task.isComplete = true
                PersistenceController.shared.save()
            } , secondaryButton: .cancel())
        }
    }
}

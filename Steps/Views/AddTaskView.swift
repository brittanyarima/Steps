//
//  AddTaskView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI
import Dependencies

struct AddTaskView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var taskName: String = ""

    var body: some View {
        VStack() {
            VStack(spacing: 7) {
                Text("🖋️ \(Constants.addNewGoal)")
                    .font(.title)
                    .bold()
                    .padding(.bottom)

                Text("💡 \(Constants.goalIdeas)")
                    .bold()
                    .foregroundColor(.secondary)
                    .font(.caption)
                VStack(alignment: .leading, spacing: 5) {
                    Text(Constants.walkWithFriend)
                }
                .foregroundColor(.secondary)
                .font(.caption)
            }
            .padding()

            Spacer()

            TextField(Constants.newGoalField, text: $taskName)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.tertiarySystemFill))
                .cornerRadius(10)
                .foregroundColor(.indigo)

            Button {
                addTask()
                dismiss()
            } label: {
                Text(Constants.save)
                    .fontWeight(.semibold)
            }
            .buttonStyle(.bordered)
            .tint(.indigo)
            .padding()

        }
        .padding(14)
    }

    func addTask() {
        let newTask = Task(context: context)
        @Dependency(\.uuid) var uuid
        newTask.id = uuid()
        newTask.isComplete = false
        newTask.name = taskName
        @Dependency(\.date) var date
        newTask.date = date()

        do {
            try context.save()
        } catch {
            // show error
            print(error)
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}

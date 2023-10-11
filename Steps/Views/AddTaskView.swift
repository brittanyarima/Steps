//
//  AddTaskView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var taskName: String = ""

    var body: some View {
        VStack() {
            VStack(spacing: 7) {
                Text("🖋️ Add New Goal", comment: "Title for add new goal")
                    .font(.title)
                    .bold()
                    .padding(.bottom)

                Text("💡 Goal ideas", comment: "Title for goal ideas")
                    .bold()
                    .foregroundColor(.secondary)
                    .font(.caption)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Walk a 5K, Walk with a friend, Increase steps goal")
                }
                .foregroundColor(.secondary)
                .font(.caption)
            }
            .padding()

            Spacer()

            TextField(text: $taskName) {
                Text("New goal...", comment: "Title for new goal")
            }
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(.tertiarySystemFill))
            .cornerRadius(10)
            .foregroundColor(.indigo)

            Button {
                addTask()
                dismiss()
            } label: {
                Text("Save", comment: "Title for save button")
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
        newTask.id = UUID()
        newTask.isComplete = false
        newTask.name = taskName
        newTask.date = Date()

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

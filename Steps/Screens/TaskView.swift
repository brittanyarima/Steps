//
//  TaskView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI

struct TaskView: View {
    @Environment(\.managedObjectContext) var context
    @State private var isShowingSheet = false
    @State private var selectedTab = "Incomplete"


    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)],
        predicate: NSPredicate(format: "isComplete == false")) var incompleteTasks: FetchedResults<Task>

    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)],
        predicate: NSPredicate(format: "isComplete == true")) var completeTasks: FetchedResults<Task>

    var body: some View {
        NavigationStack {
            VStack {
                TaskPickerView(selectedTab: $selectedTab)

                List {
                    if selectedTab == "Incomplete" {
                        ForEach(incompleteTasks) { task in
                            TaskListRowView(task: task)
                        }
                        .onDelete(perform: removeIncompleteTask)
                    } else {
                        ForEach(completeTasks) { task in
                            TaskListRowView(task: task)
                        }
                        .onDelete(perform: removeCompleteTask)
                    }
                }
                .scrollContentBackground(.hidden)
                .listRowSeparator(.hidden)

                Button {
                    isShowingSheet.toggle()
                } label: {
                    Label("Add Goal", systemImage: "plus")
                        .fontWeight(.semibold)
                }
                .buttonStyle(.bordered)
                .tint(.indigo)
            }
            .navigationTitle("✅ My Goals")
            .sheet(isPresented: $isShowingSheet) {
                AddTaskView()
                    .presentationDetents([.height(300)])
            }
        }
    }

    func removeIncompleteTask(at offsets: IndexSet) {
        for index in offsets {
            let task = incompleteTasks[index]
            context.delete(task)
        }

        do {
            try context.save()
        } catch {
            print("❗️ Error saving delete task to core data")
        }
    }

    func removeCompleteTask(at offsets: IndexSet) {
        for index in offsets {
            let task = completeTasks[index]
            context.delete(task)
        }

        do {
            try context.save()
        } catch {
            print("❗️ Error saving delete task to core data")
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

fileprivate struct TaskPickerView: View {
    @Binding var selectedTab: String
    let tabOptions = ["Incomplete", "Complete"]

    var body: some View {
        Picker("Goals", selection: $selectedTab) {
            ForEach(tabOptions, id: \.self) { tab in
                Text(tab)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

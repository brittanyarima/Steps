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
    @State private var selectedTab = Constants.incomplete
    @State private var isShowingPaywall = true

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

                if selectedTab == Constants.incomplete && incompleteTasks.isEmpty {
                    Text("🥳 \(Constants.addSomeMoreGoals)")
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }

                List {
                    if selectedTab == Constants.incomplete {
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
                .toolbar { EditButton() }

                AddGoalButton(isShowingSheet: $isShowingSheet)
            }
            .navigationTitle("✅ \(Constants.myGoals)")
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
            print(Constants.coreDataError)
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
            print(Constants.coreDataError)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

//MARK: - SUPPORTING VIEWS

fileprivate struct TaskPickerView: View {
    @Binding var selectedTab: String
    let tabOptions = [Constants.incomplete, Constants.complete]

    var body: some View {
        Picker(Constants.goalsTitle, selection: $selectedTab) {
            ForEach(tabOptions, id: \.self) { tab in
                Text(tab)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

fileprivate struct AddGoalButton: View {
    @Binding var isShowingSheet: Bool

    var body: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            Label(Constants.addGoal, systemImage: "plus")
                .fontWeight(.semibold)
        }
        .buttonStyle(.bordered)
        .tint(.indigo)
        .padding(.bottom, 30)
    }
}

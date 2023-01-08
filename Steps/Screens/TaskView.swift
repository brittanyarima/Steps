//
//  TaskView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI

struct TaskView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var userViewModel: UserViewModel
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
            if !userViewModel.isSubscriptionActive {
                PaywallView()
            } else {
                VStack {
                    TaskPickerView(selectedTab: $selectedTab)

                    if selectedTab == "Incomplete" && incompleteTasks.isEmpty {
                        Text("🥳 Time to add some more goals!")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }

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
                    .toolbar { EditButton() }

                    AddGoalButton(isShowingSheet: $isShowingSheet)
                }
                .navigationTitle("✅ My Goals")
                .sheet(isPresented: $isShowingSheet) {
                    AddTaskView()
                        .presentationDetents([.height(300)])
                }
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

fileprivate struct AddGoalButton: View {
    @Binding var isShowingSheet: Bool

    var body: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            Label("Add Goal", systemImage: "plus")
                .fontWeight(.semibold)
        }
        .buttonStyle(.bordered)
        .tint(.indigo)
        .padding(.bottom, 30)
    }
}

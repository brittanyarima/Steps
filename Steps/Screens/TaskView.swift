//
//  TaskView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI

struct TaskView: View {
    @State private var isShowingSheet = false
    @State private var selectedTab = "Incomplete"
    let tabOptions = ["Incomplete", "Complete"]

    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)],
        predicate: NSPredicate(format: "isComplete == %@")) var incompleteTasks: FetchedResults<Task>

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Goals", selection: $selectedTab) {
                    ForEach(tabOptions, id: \.self) { tab in
                        Text(tab)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
               
                ScrollView {
                    ForEach(incompleteTasks) { task in
                        TaskListRowView(task: task)
                    }

                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Label("Add Goal", systemImage: "plus")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.bordered)
                    .tint(.indigo)
                }
            }
            .navigationTitle("✅ My Goals")
            .sheet(isPresented: $isShowingSheet) {
                AddTaskView()
                    .presentationDetents([.height(300)])
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

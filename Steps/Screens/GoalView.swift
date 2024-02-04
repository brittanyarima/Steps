//
//  GoalView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI

struct GoalView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var vm: GoalViewModel

    //    @State private var isShowingSheet = false
    //    @State private var selectedTab = Constants.incomplete
    //    @State private var isShowingPaywall = true


    init(
        viewModel: GoalViewModel
    ) {
        self.vm = viewModel
    }

    @FetchRequest(
        entity: Goal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Goal.date, ascending: false)],
        predicate: NSPredicate(format: "isComplete == false")) var incompleteGoals: FetchedResults<Goal>

    @FetchRequest(
        entity: Goal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Goal.date, ascending: false)],
        predicate: NSPredicate(format: "isComplete == true")) var completeGoals: FetchedResults<Goal>

    var body: some View {
        NavigationStack {
            VStack {
                GoalPickerView(selectedTab: $vm.selectedTab)

                if vm.selectedTab == Constants.incomplete && incompleteGoals.isEmpty {
                    Text("🥳 \(Constants.addSomeMoreGoals)")
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }

                List {
                    if vm.selectedTab == Constants.incomplete {
                        ForEach(incompleteGoals) { goal in
                            GoalListRowView(goal: goal)
                        }
                        .onDelete(perform: removeIncompleteGoal)
                    } else {
                        ForEach(completeGoals) { goal in
                            GoalListRowView(goal: goal)
                        }
                        .onDelete(perform: removeCompleteGoal)
                    }
                }
                .scrollContentBackground(.hidden)
                .listRowSeparator(.hidden)
                .toolbar { EditButton() }

                AddGoalButton(isShowingSheet: $vm.isShowingSheet)
            }
            .navigationTitle("✅ \(Constants.myGoals)")
            .sheet(isPresented: $vm.isShowingSheet) {
                AddGoalView()
                    .presentationDetents([.height(300)])
            }
        }
    }

    func removeIncompleteGoal(at offsets: IndexSet) {
        for index in offsets {
            let goal = incompleteGoals[index]
            context.delete(goal)
        }

        do {
            try context.save()
        } catch {
            print(Constants.coreDataError)
        }
    }

    func removeCompleteGoal(at offsets: IndexSet) {
        for index in offsets {
            let goal = completeGoals[index]
            context.delete(goal)
        }

        do {
            try context.save()
        } catch {
            print(Constants.coreDataError)
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(viewModel: .init())
    }
}

//MARK: - SUPPORTING VIEWS

fileprivate struct GoalPickerView: View {
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

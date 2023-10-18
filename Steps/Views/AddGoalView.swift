//
//  AddGoalView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import SwiftUI
import Dependencies

struct AddGoalView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: AddGoalViewModel
    
    init(viewModel: AddGoalViewModel = .init()) {
        self.vm = viewModel
    }

    var body: some View {
        VStack() {
            VStack(spacing: 7) {
                Text(TextConstants.addNewGoal.value)
                    .font(.title)
                    .bold()
                    .padding(.bottom)

                Text(TextConstants.goalIdeas.value)
                    .bold()
                    .foregroundColor(.secondary)
                    .font(.caption)
                VStack(alignment: .leading, spacing: 5) {
                    Text(TextConstants.walkWithFriend.value)
                }
                .foregroundColor(.secondary)
                .font(.caption)
            }
            .padding()

            Spacer()

            TextField(TextConstants.newGoalField.value, text: $vm.name)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.tertiarySystemFill))
                .cornerRadius(10)
                .foregroundColor(.indigo)

            Button {
                vm.addGoal()
                dismiss()
            } label: {
                Text(TextConstants.save.value)
                    .fontWeight(.semibold)
            }
            .buttonStyle(.bordered)
            .tint(.indigo)
            .padding()

        }
        .padding(14)
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}

//
//  TaskListRowView.swift
//  Steps
//
//  Created by Brittany Rima on 1/7/23.
//

import CoreData
import SwiftUI

struct TaskListRowView: View {
    @ObservedObject var task: Task

    var body: some View {
        HStack {
            Text(task.name ?? "Unknown Name")
            Spacer()
            if task.isComplete {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.indigo)
                    .rotationEffect(.degrees(0))
                    .opacity(1)
                    .scaleEffect(1)
                    .animation(
                        Animation.easeInOut(duration: 0.6)
                            .repeatCount(1, autoreverses: false),
                        value: task.isComplete
                    )
                    .onTapGesture {
                        withAnimation {
                            task.isComplete.toggle()
                            if task.hasChanges {
                                PersistenceController.shared.save()
                            }
                        }
                    }
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.indigo)
                    .onTapGesture {
                        withAnimation {
                            task.isComplete.toggle()
                            if task.hasChanges {
                                PersistenceController.shared.save()
                            }
                        }
                    }
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
    
    private func toggleTask() {
        withAnimation {
            task.isComplete.toggle()
            if task.hasChanges {
                PersistenceController.shared.save()
            }
        }
    }
}

struct TaskListRowView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let task = Task(context: moc)
        TaskListRowView(task: task)
    }
}

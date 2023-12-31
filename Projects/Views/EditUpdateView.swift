//
//  AddUpdateView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct EditUpdateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var headline: String = ""
    @State private var summary: String = ""
    @State private var hours: String = ""
    @State private var showConfirmation: Bool = false
    
    var project: Project
    var update: ProjectUpdate
    var isEditMode: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Update" : "New Update")
                    .foregroundStyle(.white)
                    .font(.bigHeadline)
                
                TextField("Headline", text: $headline)
                
                TextField("Summary", text: $summary, axis: .vertical)
                
                HStack {
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                    
                    Button(isEditMode ? "Save" : "Add") {
                        
                        // Keep track of the difference in hours for an update edit
                        let hoursDifference = update.hours - Double(hours)!
                        
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        
                        if !isEditMode {
                            // Add Project Update
                            project.updates.insert(update, at: 0)
                            
                            // Force a SwiftDate save
                            try? context.save()
                            
                            // Update stats
                            StatsHelper.updateAdded(project: project, update: update)
                        } else {
                            // Edit Project Update
                            
                            // Update Stats
                            StatsHelper.updateEdited(project: project, hoursDifference: hoursDifference)
                        }
                        
                        // Dismiss the sheet
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    if isEditMode {
                        Button("Delete") {
                            // Show confirmation dialog
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .textFieldStyle(.roundedBorder)
        }
        .confirmationDialog("Delete?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, delete") {
                // Remove all updates from the project with the same id
                project.updates.removeAll { u in
                    u.id == update.id
                }
                
                // Force a SwiftData save
                try? context.save()
                
                // Delete Updates
                StatsHelper.updateDeleted(project: project, update: update)
                
                // Dismiss the confirmation
                dismiss()
            }
        }
        .onAppear {
            headline = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }
    }
}
//
//#Preview {
//    AddUpdateView()
//}

//
//  AddProjectView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var projectName: String = ""
    
    var project: Project
    var isEditMode: Bool
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Project" : "Add Project")
                    .foregroundStyle(.white)
                    .font(.bigHeadline)
                HStack {
                    TextField("Project name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(isEditMode ? "Save" : "Add") {
                        if isEditMode {
                            // Save the new project name
                            project.name = projectName
                        } else {
                            // Add project to SwiftData
                            project.name = projectName
                            context.insert(project)
                        }
                        // Dismiss the sheet
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(projectName.trimmingCharacters(in: .whitespacesAndNewlines) == "")
                    
                    if isEditMode {
                        // Show Delete button
                        Button("Delete") {
                            // Show confirmation dialog
                            showConfirmation = true
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .confirmationDialog("Delete?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Yes, delete") {
                // Delete project from SwiftData
                context.delete(project)
                dismiss()
            }
        }
        .onAppear {
            projectName = project.name
        }
    }
}

//#Preview {
//    AddProjectView()
//}

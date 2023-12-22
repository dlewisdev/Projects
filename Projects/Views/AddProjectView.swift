//
//  AddProjectView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI
import SwiftData

struct AddProjectView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State var projectName: String = ""
    
    var project: Project
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("New Project")
                    .foregroundStyle(.white)
                    .font(.bigHeadline)
                HStack {
                    TextField("Project name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save") {
                        //Todo: Save project to SwiftData
                        project.name = projectName
                        context.insert(project)
                        // Dismiss the sheet
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

//#Preview {
//    AddProjectView()
//}

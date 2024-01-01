//
//  EditFocusView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/25/23.
//

import SwiftUI

struct EditFocusView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State var focus: String = ""
    
    var project: Project
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Edit Project Focus")
                    .foregroundStyle(.white)
                    .font(.bigHeadline)
                HStack {
                    TextField("Focus", text: $focus)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save") {
                        // Save the focus of the project
                        project.focus = focus
                        
                        // Dismiss the sheet
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(focus.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }
}

//#Preview {
//    EditFocusView()
//}

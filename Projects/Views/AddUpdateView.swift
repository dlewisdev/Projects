//
//  AddUpdateView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct AddUpdateView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var headline: String = ""
    @State private var summary: String = ""
    @State private var hours: String = ""
    
    var project: Project
    var update: ProjectUpdate
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("New Update")
                    .foregroundStyle(.white)
                    .font(.bigHeadline)
                
                TextField("Headline", text: $headline)
                
                TextField("Summary", text: $summary, axis: .vertical)
                
                HStack {
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                    
                    Button("Save") {
                        //Todo: Save Project Update
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours) ?? 0.0
                        project.updates.append(update)
                        
                        // Dismiss the sheet
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .textFieldStyle(.roundedBorder)
        }
    }
}
//
//#Preview {
//    AddUpdateView()
//}

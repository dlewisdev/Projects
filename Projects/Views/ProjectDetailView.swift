//
//  ProjectDetailView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct ProjectDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var project: Project
    
    
    var body: some View {
        VStack {
            Text(project.name)
                .navigationBarBackButtonHidden(true)
            
            Button("Back") {
                dismiss()
            }
        }
        
        
    }
}

#Preview {
    ProjectDetailView(project: Project())
}

//
//  ContentView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/20/23.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    @State private var newProject: Project?
    @Query private var projects: [Project]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Projects")
                    .font(.screenHeading)
                    .foregroundStyle(.white)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 26) {
                        ForEach(projects) { project in
                            ProjectCard(project: project)
                        }
                    }
                }
                
                
            }
            .padding()
            
            VStack {
                Spacer()
                HStack {
                    Button {
                        // Create new project
                        self.newProject = Project()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 65)
                                .foregroundColor(.black)
                            Image(.cross)
                        }
                    }
                    Spacer()
                }
                .padding(.leading)
            }
        }
        .sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.fraction(0.2)])
        }
    }
}

#Preview {
    ProjectListView()
}

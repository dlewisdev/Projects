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
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.deepPurple, Color.blushPink], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                // ScrollView of projects
                VStack(alignment: .leading) {
                    Text("Projects")
                        .font(.screenHeading)
                        .foregroundStyle(.white)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 26) {
                            ForEach(projects) { project in
                                
                                NavigationLink {
                                    ProjectDetailView(project: project)
                                } label: {
                                    ProjectCard(project: project)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding()
                
                // Button
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
}

#Preview {
    ProjectListView()
}

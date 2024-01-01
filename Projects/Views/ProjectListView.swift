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
    
    @State private var selectedProject: Project?
    
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
                    if projects.count > 0 {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 26) {
                                ForEach(projects) { project in
                                    ProjectCard(project: project)
                                        .onTapGesture {
                                            selectedProject = project
                                        }
                                        .onLongPressGesture {
                                            newProject = project
                                        }
                                }
                            }
                        }
                    } else {
                        // If there are no projects
                        Spacer()
                        HStack {
                            Spacer()
                            Button("Tap to add a new project") {
                                newProject = Project()
                            }
                            .buttonStyle(.bordered)
                            .foregroundStyle(.white)
                            Spacer()
                        }
                        Spacer()
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
            .navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
            }
            
            
        }
        .sheet(item: $newProject) { project in
            let isEdit = project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            
            EditProjectView(project: project, isEditMode: isEdit)
                .presentationDetents([.fraction(0.2)])
        }
    }
}

#Preview {
    ProjectListView()
}

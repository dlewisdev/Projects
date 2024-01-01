//
//  ProjectDetailView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var newUpdate: ProjectUpdate?
    @State private var showEditFocus = false
    
    var project: Project
   
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.navy, Color.skyBlue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [Color.washedBlue.opacity(0), Color.skyBlue], startPoint: .top, endPoint: .bottom)
                .frame(width: 1)
                .padding(.leading, -150)
            
            VStack{
                VStack(alignment: .leading, spacing: 13) {
                    Text(project.name)
                        .font(.screenHeading)
                    
                    
                    HStack(alignment: .center, spacing: 13) {
                        Spacer()
                        StatBubbleView(title: "Hours",
                                       stat: project.hours,
                                       gradientStart: Color.skyBlue,
                                       gradientEnd: Color.navy)
                        StatBubbleView(title: "Sessions",
                                       stat: Double(project.sessions),
                                       gradientStart: Color.turtleGreen,
                                       gradientEnd: Color.lime)
                        StatBubbleView(title: "Updates",
                                       stat: Double(project.updates.count),
                                       gradientStart: Color.maroon,
                                       gradientEnd: Color.fuschia)
                        StatBubbleView(title: "Wins",
                                       stat: Double(project.wins),
                                       gradientStart: Color.maroon,
                                       gradientEnd: Color.olive)
                        Spacer()
                    }
                    
                    Text("My current focus is... ")
                        .font(.featuredText)
                    HStack {
                        if project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                            
                            Button {
                                completeMilestone()
                            } label: {
                                Image(systemName: "checkmark.square")
                            }
                        }
                        Text(project.focus.trimmingCharacters(in: .whitespacesAndNewlines) == "" ? "Tap to set your focus" : project.focus)
                            .font(.featuredText)
                            .onTapGesture {
                                // Display the edit focus form
                                showEditFocus = true
                            }
                    }
                    .padding(.leading)
                    
                }
                .foregroundStyle(.white)
                .padding()
                .background {
                    Color.black
                        .opacity(0.7)
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                }
                if project.updates.count > 0 {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 27) {
                            ForEach(project.updates.sorted(by: { u1, u2 in u1.date > u2.date})) { update in
                                ProjectUpdateCard(update: update)
                                    .onTapGesture {
                                        // Adding this to allow scrollview so long press gesture does not eat up taps
                                    }
                                    .onLongPressGesture {
                                        newUpdate = update
                                    }
                            }
                        }
                        .padding(.bottom, 100)
                        
                    }
                    .padding(.horizontal)
                } else {
                    // If there are no projects
                    Spacer()
                    HStack {
                        Spacer()
                        Button("Tap to add a new update") {
                            newUpdate = ProjectUpdate()
                        }
                        .buttonStyle(.bordered)
                        .foregroundStyle(.white)
                        .padding(.bottom, 100)
                        Spacer()
                    }
                    Spacer()
                }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Button {
                        // Add project update
                        newUpdate = ProjectUpdate()
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.black)
                                .frame(width: 65)
                            Image(.cross)
                        }
                        .padding([.leading, .top])
                    }
                    Spacer()
                    Button("Back") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .tint(.black)
                    .padding([.trailing, .top])
                }
                .background {
                    Color.black
                        .opacity(0.5)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(item: $newUpdate) { update in
            let isEdit = update.headline.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            
            EditUpdateView(project: project, update: update, isEditMode: isEdit)
                .presentationDetents([.fraction(0.3)])
        }
        .sheet(isPresented: $showEditFocus) {
            EditFocusView(project: project)
                .presentationDetents([.fraction(0.2)])
        }

        
        
        
    }
    
    func completeMilestone() {
        // Create a new project update for milestone
        let update = ProjectUpdate()
        update.updateType = .milestone
        update.headline = "Milestone Achieved"
        update.summary = project.focus
        project.updates.insert(update, at: 0)
        
        // Force a SwiftDate save
        try? context.save()
        
        // Update the stats
        StatsHelper.updateAdded(project: project, update: update)
        
        // Clear the project focus
        project.focus = ""
    }
}

#Preview {
    ProjectDetailView(project: Project())
}

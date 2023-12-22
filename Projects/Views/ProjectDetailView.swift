//
//  ProjectDetailView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct ProjectDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var update: ProjectUpdate?
    
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
                                       stat: "290",
                                       gradientStart: Color.skyBlue,
                                       gradientEnd: Color.navy)
                        StatBubbleView(title: "Sessions",
                                       stat: "34",
                                       gradientStart: Color.turtleGreen,
                                       gradientEnd: Color.lime)
                        StatBubbleView(title: "Updates",
                                       stat: "32",
                                       gradientStart: Color.maroon,
                                       gradientEnd: Color.fuschia)
                        StatBubbleView(title: "Wins",
                                       stat: "9",
                                       gradientStart: Color.maroon,
                                       gradientEnd: Color.olive)
                        Spacer()
                    }
                    
                    Text("My current focus is... ")
                        .font(.featuredText)
                    HStack {
                        Image(systemName: "checkmark.square")
                        Text("Finish the iOS Databases course")
                            .font(.featuredText)
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
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 27) {
                        ForEach(project.updates) { update in
                            ProjectUpdateCard(update: update)
                        }
                    }
                    .padding(.bottom, 100)
                        
                }
                .padding(.horizontal)
                
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Button {
                        // Add project update
                        self.update = ProjectUpdate()
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
        .sheet(item: $update) { update in
            AddUpdateView(project: project, update: update)
                .presentationDetents([.fraction(0.3)])
        }
        
        
        
    }
}

#Preview {
    ProjectDetailView(project: Project())
}

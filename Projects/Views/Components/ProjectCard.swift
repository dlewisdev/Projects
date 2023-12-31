//
//  ProjectCard.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct ProjectCard: View {
    var project: Project
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(.black)
                .opacity(0.7)
                .shadow(radius: 10, x: 0, y: 4)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(project.name)
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
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
                
                if project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Text("My current focus is...")
                        .font(.featuredText)
                        .foregroundStyle(.gray)
                    Text(project.focus)
                        .font(.featuredText)
                        .foregroundStyle(.gray)
                        .bold()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ProjectCard(project: Project())
}

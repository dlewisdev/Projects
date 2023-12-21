//
//  ContentView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/20/23.
//

import SwiftUI

struct ProjectListView: View {
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
                        ProjectCard()
                        ProjectCard()
                        ProjectCard()
                        ProjectCard()
                        ProjectCard()
                    }
                }
                
                
            }
            .padding()
            
            VStack {
                Spacer()
                HStack {
                    Button {
                        
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
    }
}

#Preview {
    ProjectListView()
}

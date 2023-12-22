//
//  ProjectUpdateCard.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct ProjectUpdateCard: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x: 0, y: 4)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Thursday, December 21, 2023")
                    Spacer()
                    Text("9 Hours")
                }
                .padding(.horizontal)
                .padding(.vertical, 7)
                .background {
                    Color.orchid
                }
                
                Text("Project headline")
                    .font(.smallHeadline)
                    .padding(.horizontal)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .font(.regularText)
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProjectUpdateCard()
}

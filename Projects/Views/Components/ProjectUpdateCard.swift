//
//  ProjectUpdateCard.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct ProjectUpdateCard: View {
    var update: ProjectUpdate
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .shadow(radius: 5, x: 0, y: 4)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(DateHelper.projectUpdateDate(inputDate: update.date))
                    Spacer()
                    Text("\(String(Int(update.hours))) Hours")
                }
                .padding(.horizontal)
                .padding(.vertical, 7)
                .background {
                    Color.orchid
                }
                
                Text(update.headline)
                    .font(.smallHeadline)
                    .padding(.horizontal)
                Text(update.summary)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .foregroundStyle(.white)
            .font(.regularText)
            
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.top, 10)
    }
}

//#Preview {
//    ProjectUpdateCard()
//}

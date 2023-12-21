//
//  StatBubbleView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct StatBubbleView: View {
    var title: String
    var stat: String
    var gradientStart: Color
    var gradientEnd: Color
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .fill( LinearGradient(colors: [gradientStart, gradientEnd],
                                      startPoint: .topLeading,
                                      endPoint: .bottomTrailing))
            
            VStack {
                Text(title)
                    .font(.captionText)
                Text(stat)
                    .font(.featuredNumber)
                    .bold()
            }
            .foregroundStyle(.white)
           
            
        }
        .frame(width: 60, height: 40)
    }
}

#Preview {
    StatBubbleView(title: "Hour", stat: "290", gradientStart: Color.blue, gradientEnd: Color.navy)
}

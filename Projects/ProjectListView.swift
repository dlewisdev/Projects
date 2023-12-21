//
//  ContentView.swift
//  Projects
//
//  Created by Danielle Lewis on 12/20/23.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("cross")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.screenHeading)
                .foregroundStyle(.orchid)
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}

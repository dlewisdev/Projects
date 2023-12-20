//
//  ProjectsApp.swift
//  Projects
//
//  Created by Danielle Lewis on 12/20/23.
//

import SwiftUI
import SwiftData

@main
struct ProjectsApp: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self, ProjectUpdate.self])
        }
    }
}

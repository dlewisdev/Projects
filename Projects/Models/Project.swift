//
//  Project.swift
//  Projects
//
//  Created by Danielle Lewis on 12/20/23.
//

import Foundation
import SwiftData

@Model
class Project {
    @Attribute(.unique) var id: String
    var name = ""
    var startDate = Date()
    var focus: String = ""
    
    @Relationship(deleteRule: .cascade, inverse: \ProjectUpdate.project)
    var updates: [ProjectUpdate] = [ProjectUpdate]()
    
    init() {
        id = UUID().uuidString
    }
}

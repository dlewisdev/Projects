//
//  ProjectUpdate.swift
//  Projects
//
//  Created by Danielle Lewis on 12/20/23.
//

import Foundation
import SwiftData

@Model
class ProjectUpdate {
    @Attribute(.unique) var id: String
    var headline = ""
    var summary = ""
    var date = Date()
    var hours = 0.0
    var updateType = UpdateType.log
    var project: Project?
    
    init() {
        id = UUID().uuidString
    }
}

enum UpdateType: Codable {
    case log
    case milestone
}

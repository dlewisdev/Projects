//
//  StatsHelper.swift
//  Projects
//
//  Created by Danielle Lewis on 12/31/23.
//

import Foundation
import SwiftUI

struct StatsHelper {
    // This method should be run AFTER a new update is added to the project's updates array
    static func updateAdded(project: Project, update: ProjectUpdate) {
        // Change the hours
        project.hours += update.hours
        
        // Change wins
        if update.updateType == .milestone {
            project.wins += 1
        }
        
        // Change sessions
        let sortedUpdates = project.updates.sorted { u1, u2 in
            u1.date > u2.date
        }
        
        // Check if there are more than 2 updats
        if sortedUpdates.count >= 2 {
            // Check if the latest 2 updates have the same date
            let date1 = sortedUpdates[0].date
            let date2 = sortedUpdates[1].date
            if !Calendar.current.isDate(date1, inSameDayAs: date2) {
                
                // If not the same day, the latest update is the first one of today
                project.sessions += 1
                
            }
        } else {
            // Since there are less than 2 updates, this is the first of today
            project.sessions += 1
        }
    }
    
    // Run this AFTER update has been removed form project.updates array
    static func updateDeleted(project: Project, update: ProjectUpdate) {
        // Change hours
        project.hours -= update.hours
        // Change wins
        if update.updateType == .milestone {
            project.wins -= 1
        }
        // Change sessions
        let sameDayUpdates = project.updates.filter { u in
            Calendar.current.isDate(u.date, inSameDayAs: update.date)
        }
        
        if sameDayUpdates.count == 0 {
            // That means the deleted update was the only update of that day
            project.sessions -= 1
        }
    }
    
    static func updateEdited(project: Project, hoursDifference: Double) {
        // Change hours
        project.hours += hoursDifference
    }
}

//
//  DateFormatter.swift
//  Projects
//
//  Created by Danielle Lewis on 12/21/23.
//

import Foundation

struct DateHelper {
    static func projectUpdateDate(inputDate: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMMM d, yyyy"
        return df.string(from: inputDate)
    }
}

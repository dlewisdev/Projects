//
//  TextHelper.swift
//  Projects
//
//  Created by Danielle Lewis on 12/31/23.
//

import Foundation

struct TextHelper {
    static func convertStat(input: Double) -> String {
        switch input {
        case let stat where input > 1000:
            // Divide by 1000, replace with "k"
            let dividedStat = stat/1000
            // Example: what if hours is not a clean number like 2324?
            // 2.324 * 10 = 23.24
            // round(23.24) = 23
            // 23 / 10 = 2.3
            // 2.3k
            return "\(round(dividedStat * 10) / 10)k"
        default:
            return String(Int(input))
        }
    }
    
    static func limitCharacters(input: String, limit: Int) -> String {
        // If the input is above the limit, take the number of characters up to the limit
        if input.count > limit {
            return String(input.prefix(limit))
        }
        
        return input
    }
}

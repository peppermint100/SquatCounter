//
//  SquatResult.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/17/24.
//

import Foundation

struct SquatResult {
    let id = UUID()
    let count: Int
    let duration: TimeInterval
    
    var interval: Double {
        duration / Double(count)
    }
}

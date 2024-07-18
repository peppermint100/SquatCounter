//
//  TimeInterval+Extension.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/18/24.
//

import Foundation

extension TimeInterval {
    
    func formatAsPace() -> String {
        return String(format: "%.2f", self)
    }
    
    func formatForTimer() -> String {
        let hours = Int(self) / 3600
        let minutes = (Int(self) % 3600) / 60
        let seconds = Int(self) % 60

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

//
//  LowPassFilter.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/26/24.
//

import Foundation

final class LowPassFilter {
    private var filterFactor: Double
    private var previousValue: Double?

    init(filterFactor: Double) {
        self.filterFactor = filterFactor
    }

    func filter(value: Double) -> Double {
        if let previousValue = previousValue {
            let filteredValue = previousValue + filterFactor * (value - previousValue)
            self.previousValue = filteredValue
            return filteredValue
        } else {
            previousValue = value
            return value
        }
    }
}

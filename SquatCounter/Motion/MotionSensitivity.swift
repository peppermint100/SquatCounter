//
//  MotionSensitivity.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/23/24.
//

import Foundation

enum MotionSensitivity: String, CaseIterable, Identifiable {
    case veryLow
    case low
    case medium
    case high
    case veryHigh
    
    var id: String {
        self.rawValue
    }
    
    var title: String {
        switch self {
        case .veryLow:
            R.string.localizable.veryLow()
        case .low:
            R.string.localizable.low()
        case .medium:
            R.string.localizable.medium()
        case .high:
            R.string.localizable.high()
        case .veryHigh:
            R.string.localizable.veryHigh()
        }
    }
    
    var iPhoneThreshold: MotionSensitivityThreshhold {
        switch self {
        case .veryLow:
            return MotionSensitivityThreshhold(ascending: 0.02, descending: -0.05, bottom: -0.01)
        case .low:
            return MotionSensitivityThreshhold(ascending: 0.04, descending: -0.075, bottom: -0.02)
        case .medium:
            return MotionSensitivityThreshhold(ascending: 0.06, descending: -0.1, bottom: -0.03)
        case .high:
            return MotionSensitivityThreshhold(ascending: 0.08, descending: -0.15, bottom: -0.04)
        case .veryHigh:
            return MotionSensitivityThreshhold(ascending: 0.1, descending: -0.2, bottom: -0.05)
        }
    }
    
    var airPodsThreshold: MotionSensitivityThreshhold {
        switch self {
        case .veryLow:
            return MotionSensitivityThreshhold(ascending: 0.1, descending: -0.025, bottom: -0.005)
        case .low:
            return MotionSensitivityThreshhold(ascending: 0.2, descending: -0.05, bottom: -0.01)
        case .medium:
            return MotionSensitivityThreshhold(ascending: 0.3, descending: -0.1, bottom: -0.015)
        case .high:
            return MotionSensitivityThreshhold(ascending: 0.4, descending: -0.15, bottom: -0.02)
        case .veryHigh:
            return MotionSensitivityThreshhold(ascending: 0.5, descending: -0.2, bottom: -0.025)
        }
    }
    
    static func sliderValue(for sensitivity: MotionSensitivity) -> Double {
        switch sensitivity {
        case .veryLow:
            return 0
        case .low:
            return 1
        case .medium:
            return 2
        case .high:
            return 3
        case .veryHigh:
            return 4
        }
    }
}

struct MotionSensitivityThreshhold {
    let ascending: Double
    let descending: Double
    let bottom: Double
}


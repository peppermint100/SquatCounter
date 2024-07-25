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
            return MotionSensitivityThreshhold(ascending: 0.1, descending: -0.4, bottom: -0.11, motionUpdateInterval: 0.2)
        case .low:
            return MotionSensitivityThreshhold(ascending: 0.09, descending: -0.3, bottom: -0.09, motionUpdateInterval: 0.1)
        case .medium:
            return MotionSensitivityThreshhold(ascending: 0.07, descending: -0.25, bottom: -0.08, motionUpdateInterval: 0.07)
        case .high:
            return MotionSensitivityThreshhold(ascending: 0.05, descending: -0.1, bottom: -0.06, motionUpdateInterval: 0.05)
        case .veryHigh:
            return MotionSensitivityThreshhold(ascending: 0.03, descending: -0.07, bottom: -0.04, motionUpdateInterval: 0.03)
        }
    }
    
    var airPodsThreshold: MotionSensitivityThreshhold {
        switch self {
        case .veryLow:
            return MotionSensitivityThreshhold(ascending: 0.15, descending: -0.15, bottom: -0.003, motionUpdateInterval: 0.2)
        case .low:
            return MotionSensitivityThreshhold(ascending: 0.12, descending: -0.12, bottom: -0.005, motionUpdateInterval: 0.1)
        case .medium:
            return MotionSensitivityThreshhold(ascending: 0.08, descending: -0.07, bottom: -0.007, motionUpdateInterval: 0.07)
        case .high:
            return MotionSensitivityThreshhold(ascending: 0.06, descending: -0.06, bottom: -0.01, motionUpdateInterval: 0.05)
        case .veryHigh:
            return MotionSensitivityThreshhold(ascending: 0.04, descending: -0.03, bottom: -0.0, motionUpdateInterval: 0.03)
        }
    }
}

struct MotionSensitivityThreshhold {
    let ascending: Double
    let descending: Double
    let bottom: Double
    let motionUpdateInterval: Double
}


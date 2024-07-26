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
            return MotionSensitivityThreshhold(ascending: -0.00, descending: -0.06, bottom: -0.05, motionUpdateInterval: 0.12, minimumSquatTime: 0.7)
        case .low:
            return MotionSensitivityThreshhold(ascending: -0.00, descending: -0.05, bottom: -0.04, motionUpdateInterval: 0.1, minimumSquatTime: 0.6)
        case .medium:
            return MotionSensitivityThreshhold(ascending: -0.01, descending: -0.04, bottom: -0.03, motionUpdateInterval: 0.08, minimumSquatTime: 0.3)
        case .high:
            return MotionSensitivityThreshhold(ascending: -0.01, descending: -0.03, bottom: -0.02, motionUpdateInterval: 0.06, minimumSquatTime: 0.4)
        case .veryHigh:
            return MotionSensitivityThreshhold(ascending: -0.02, descending: -0.02, bottom: -0.01, motionUpdateInterval: 0.04, minimumSquatTime: 0.3)
        }
    }
    
    var airPodsThreshold: MotionSensitivityThreshhold {
        switch self {
        case .veryLow:
            return MotionSensitivityThreshhold(ascending: 0.04, descending: -0.04, bottom: -0.035, motionUpdateInterval: 0.12, minimumSquatTime: 0.7)
        case .low:
            return MotionSensitivityThreshhold(ascending: 0.03, descending: -0.03, bottom: -0.025, motionUpdateInterval: 0.11, minimumSquatTime: 0.6)
        case .medium:
            return MotionSensitivityThreshhold(ascending: 0.02, descending: -0.025, bottom: -0.02, motionUpdateInterval: 0.1, minimumSquatTime: 0.5)
        case .high:
            return MotionSensitivityThreshhold(ascending: 0.01, descending: -0.02, bottom: -0.015, motionUpdateInterval: 0.09, minimumSquatTime: 0.4)
        case .veryHigh:
            return MotionSensitivityThreshhold(ascending: 0.0, descending: -0.015, bottom: -0.01, motionUpdateInterval: 0.07, minimumSquatTime: 0.3)
        }
    }
}

struct MotionSensitivityThreshhold {
    let ascending: Double
    let descending: Double
    let bottom: Double
    let motionUpdateInterval: TimeInterval
    let minimumSquatTime: TimeInterval
}


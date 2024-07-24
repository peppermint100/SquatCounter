//
//  SettingManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/23/24.
//

import Foundation

final class SettingManager {
    
    static func getAirPodsMotionSensitivity() -> MotionSensitivity {
        guard 
            let stringValue = UserDefaults.standard.string(forKey: UserDefaultsKey.airPodsMotionSensitivity),
            let motionSensitivity = MotionSensitivity(rawValue: stringValue)
        else {
            return .medium
        }
        
        return motionSensitivity
    }
    
    static func getiPhoneMotionSensitivity() -> MotionSensitivity {
        guard
            let stringValue = UserDefaults.standard.string(forKey: UserDefaultsKey.iPhoneMotionSensitivity),
            let motionSensitivity = MotionSensitivity(rawValue: stringValue)
        else {
            return .medium
        }
        
        return motionSensitivity
    }
}

//
//  iPhoneMotionManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation
import CoreMotion
import Combine

final class iPhoneMotionManager: MotionManager {
    
    var descendingThreshold: Double
    var bottomThreshold: Double
    var ascendingThreshold: Double
    var timeThreshhold: Double
    var motionSensitivity: MotionSensitivity = SettingManager.getiPhoneMotionSensitivity()
    
    let accelerationSubject = PassthroughSubject<Double, Never>()
    
    private let cmManager = CMMotionManager()
    private let lowPassFilter = LowPassFilter(filterFactor: 0.1)
    
    var isActive: Bool {
        cmManager.isDeviceMotionActive
    }
    
    init() {
        cmManager.deviceMotionUpdateInterval = motionSensitivity.iPhoneThreshold.motionUpdateInterval
        descendingThreshold = motionSensitivity.iPhoneThreshold.descending
        ascendingThreshold = motionSensitivity.iPhoneThreshold.ascending
        bottomThreshold = motionSensitivity.iPhoneThreshold.bottom
        timeThreshhold = motionSensitivity.iPhoneThreshold.minimumSquatTime
    }
    
    func startMotionUpdates() {
        cmManager.startDeviceMotionUpdates(to: .current!) { [weak self] motion, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if
                let motion = motion,
                let yAcceleration = self?.lowPassFilter.filter(value: motion.userAcceleration.y)
            {
                self?.accelerationSubject.send(yAcceleration)
            }
        }
    }
    
    func stopMotionUpdates() {
        cmManager.stopDeviceMotionUpdates()
    }
}

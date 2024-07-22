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
    
    var descendingThreshold = -1.1
    var bottomThreshold = -0.1
    var ascendingThreshold = -0.7
    
    let accelerationSubject = PassthroughSubject<Double, Never>()
    
    private let cmManager = CMMotionManager()
    
    var isActive: Bool {
        cmManager.isDeviceMotionActive
    }
    
    init() {
        cmManager.deviceMotionUpdateInterval = 0.35
    }
    
    func startMotionUpdates() {
        cmManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let motion = motion {
                print(motion.userAcceleration)
                self?.accelerationSubject.send(motion.userAcceleration.y)
            }
        }
    }
    
    func stopMotionUpdates() {
        cmManager.stopDeviceMotionUpdates()
    }
}

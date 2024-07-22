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
    
    var descendingThreshold = -0.1
    var bottomThreshold = -0.03
    var ascendingThreshold = 0.06
    
    let accelerationSubject = PassthroughSubject<Double, Never>()
    
    private let cmManager = CMMotionManager()
    
    var isActive: Bool {
        cmManager.isDeviceMotionActive
    }
    
    init() {
        cmManager.deviceMotionUpdateInterval = 0.25
    }
    
    func startMotionUpdates() {
        cmManager.startDeviceMotionUpdates(to: .current!) { [weak self] motion, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let motion = motion {
                self?.accelerationSubject.send(motion.userAcceleration.y)
            }
        }
    }
    
    func stopMotionUpdates() {
        cmManager.stopDeviceMotionUpdates()
    }
}

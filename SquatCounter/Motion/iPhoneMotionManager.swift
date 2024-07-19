//
//  iPhoneMotionManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation
import CoreMotion
import Combine

final class iPhoneMotionManager: MotionManager, ObservableObject {
    
    var descendingThreshold = -1.1
    var bottomThreshold = -0.1
    var ascendingThreshold = -0.7
    
    @Published var isActive: Bool = false
    let accelerationSubject = PassthroughSubject<Double, Never>()
    
    private let cmManager = CMMotionManager()
    
    init() {
        cmManager.deviceMotionUpdateInterval = 0.5
    }
    
    func startMotionUpdates() {
        isActive = true
        cmManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
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
        isActive = false
        cmManager.stopDeviceMotionUpdates()
    }
}

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
    
    @Published var isActive: Bool = false
    let accelerationSubject = PassthroughSubject<Double, Never>()
    
    private let cmManager = CMMotionManager()
    
    var isMotionSensorPermitted: Bool = false
    var isDeviceAvailable: Bool = false
    
    init() {
        self.isDeviceAvailable = cmManager.isDeviceMotionAvailable
        cmManager.deviceMotionUpdateInterval = 0.1
        updateMotionSensorPermission()
    }
    
    private func updateMotionSensorPermission() {
        cmManager.startDeviceMotionUpdates(to: .main) { [weak self] _, error in
            if let error = error {
                print(error.localizedDescription)
                self?.isMotionSensorPermitted = false
                self?.isDeviceAvailable = false
            } else {
                self?.isMotionSensorPermitted = true
                self?.isDeviceAvailable = true
            }
        }
        cmManager.stopDeviceMotionUpdates()
    }
    
    func startMotionUpdates() {
        isActive = true
        cmManager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
            if let error = error {
                print(error.localizedDescription)
                self?.isDeviceAvailable = false
                self?.isMotionSensorPermitted = false
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

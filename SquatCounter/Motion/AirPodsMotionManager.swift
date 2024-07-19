//
//  AirPodsMotionManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation
import CoreMotion
import Combine

final class AirPodsMotionManager: MotionManager, ObservableObject {
    
    @Published var isActive: Bool = false
    let accelerationSubject = PassthroughSubject<Double, Never>()
    
    private let cmManager = CMHeadphoneMotionManager()
    
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

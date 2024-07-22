//
//  AirPodsMotionManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation
import CoreMotion
import Combine

final class AirPodsMotionManager: MotionManager {
    
    var descendingThreshold = -0.01
    var bottomThreshold = -0.001
    var ascendingThreshold = 0.04
    

    let accelerationSubject = PassthroughSubject<Double, Never>()
    private var timerCancellable: AnyCancellable?
    
    private let cmManager = CMHeadphoneMotionManager()
    
    var isActive: Bool {
        cmManager.isDeviceMotionActive
    }
    
    func startMotionUpdates() {
        cmManager.startDeviceMotionUpdates()
        timerCancellable = Timer.publish(every: 0.35, on: .current, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.fetchMotionData()
            }
    }
    
    private func fetchMotionData() {
        if let deviceMotion = cmManager.deviceMotion {
            accelerationSubject.send(deviceMotion.userAcceleration.y)
        }
    }
    
    func stopMotionUpdates() {
        cmManager.stopDeviceMotionUpdates()
    }
    
    deinit {
        timerCancellable?.cancel()
    }
}

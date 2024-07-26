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
    
    var motionSensitivity: MotionSensitivity = SettingManager.getAirPodsMotionSensitivity()
    var descendingThreshold: Double
    var bottomThreshold: Double
    var ascendingThreshold: Double
    var timeThreshhold: Double
    
    let accelerationSubject = PassthroughSubject<Double, Never>()
    private var timerCancellable: AnyCancellable?
    
    private let cmManager = CMHeadphoneMotionManager()
    private let lowPassFilter = LowPassFilter(filterFactor: 0.1)
    
    init() {
        descendingThreshold = motionSensitivity.airPodsThreshold.descending
        ascendingThreshold = motionSensitivity.airPodsThreshold.ascending
        bottomThreshold = motionSensitivity.airPodsThreshold.bottom
        timeThreshhold = motionSensitivity.iPhoneThreshold.minimumSquatTime
    }
    
    var isActive: Bool {
        cmManager.isDeviceMotionActive
    }
    
    func startMotionUpdates() {
        cmManager.startDeviceMotionUpdates()
        timerCancellable = Timer.publish(every: motionSensitivity.airPodsThreshold.motionUpdateInterval, on: .current, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.fetchMotionData()
            }
    }
    
    private func fetchMotionData() {
        if let motion = cmManager.deviceMotion {
            let yAcceleration = lowPassFilter.filter(value: motion.userAcceleration.y)
            accelerationSubject.send(yAcceleration)
        }
    }
    
    func stopMotionUpdates() {
        cmManager.stopDeviceMotionUpdates()
    }
    
    deinit {
        timerCancellable?.cancel()
    }
}

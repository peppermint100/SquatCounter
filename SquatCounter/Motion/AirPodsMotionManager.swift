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
    
    var descendingThreshold = -0.003
    var bottomThreshold = -0.001
    var ascendingThreshold = 0.04
    
    @Published var isActive: Bool = false
    let accelerationSubject = PassthroughSubject<Double, Never>()
    private var timerCancellable: AnyCancellable?
    
    private let cmManager = CMHeadphoneMotionManager()
    
    func startMotionUpdates() {
        isActive = true
        cmManager.startDeviceMotionUpdates()
        timerCancellable = Timer.publish(every: 0.5, on: .current, in: .common)
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
        isActive = false
        cmManager.stopDeviceMotionUpdates()
    }
    
    deinit {
        timerCancellable?.cancel()
    }
}

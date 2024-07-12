//
//  MotionManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation
import Combine

protocol MotionManager {
    var isMotionSensorPermitted: Bool { get }
    var isDeviceAvailable: Bool { get }
    
    /**
     MotionManager가 디바이스로부터 데이터를 받고 있는지
    */
    var isActive: Bool { get }
    var accelerationSubject: PassthroughSubject<Double, Never> { get }
    
    func startMotionUpdates()
    func stopMotionUpdates()
}

//
//  CoreMotionManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import Foundation
import CoreMotion

class CoreMotionManager {
    
    private let cm = CMMotionManager()
    private let hm = CMHeadphoneMotionManager()
    
    func requestPermission() {
        cm.startDeviceMotionUpdates(to: .main) { [weak self] _, _ in
            self?.cm.stopDeviceMotionUpdates()
        }
        
        hm.startDeviceMotionUpdates(to: .main) { [weak self] _, _ in
            self?.hm.stopDeviceMotionUpdates()
        }
    }
}

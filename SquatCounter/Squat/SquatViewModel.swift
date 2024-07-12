//
//  SquatViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation

final class SquatViewModel: ObservableObject {
    
    private let motionManager: MotionManager
    
    init(motionManager: MotionManager) {
        self.motionManager = motionManager
        motionManager.startMotionUpdates()
    }
    
    deinit {
        motionManager.stopMotionUpdates()
    }
}

//
//  SquatViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation
import Combine

final class SquatViewModel: ObservableObject {
    
    private let motionManager: MotionManager
    private var cancelBag = Set<AnyCancellable>()
    
    @Published var isSquating = false
    @Published var squatCount = 0
    
    init(motionManager: MotionManager) {
        self.motionManager = motionManager
        motionManager.startMotionUpdates()
        addSubscribers()
    }
    
    private func addSubscribers() {
        motionManager.accelerationSubject.sink { [weak self] acceleration in
            self?.detectSquat(acceleration: acceleration)
        }
        .store(in: &cancelBag)
    }
    
    private func detectSquat(acceleration: Double) {
        if acceleration > -1.1 {
            isSquating = true
        } else if acceleration < -0.7 {
            isSquating = false
            squatCount += 1
        }
    }
    
    deinit {
        motionManager.stopMotionUpdates()
    }
}

//
//  OnBoardingViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import Foundation
import Combine
import CoreMotion

final class OnBoardingViewModel: ObservableObject {
    
    var nextButtonSubject = PassthroughSubject<Void, Never>()
    
    func nextButtonTapped() {
        let manager = CMMotionActivityManager()
        manager.startActivityUpdates(to: .main) { _ in
            return
        }
        manager.stopActivityUpdates()
        nextButtonSubject.send()
    }
}

//
//  OnBoardingViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import Foundation
import Combine

final class OnBoardingViewModel: ObservableObject {
    
    var nextButtonSubject = PassthroughSubject<Void, Never>()
    
    func nextButtonTapped() {
        let cmManager = CoreMotionManager()
        cmManager.requestPermission()
        nextButtonSubject.send()
    }
}

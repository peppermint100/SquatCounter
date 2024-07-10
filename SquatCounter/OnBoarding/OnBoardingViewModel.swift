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
    private let cmManager = CoreMotionManager()
    private let cbManager = BluetoothManager()

    func nextButtonTapped() {
        cmManager.requestPermission()
        cbManager.requestPermission()
        nextButtonSubject.send()
    }
}

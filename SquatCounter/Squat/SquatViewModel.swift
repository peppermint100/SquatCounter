//
//  SquatViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation
import Combine
import AVFoundation

final class SquatViewModel: ObservableObject {
    
    private let motionManager: MotionManager
    private var cancelBag = Set<AnyCancellable>()
    
    let finishSquat = PassthroughSubject<Void, Never>()
    
    var device: Device
    @Published var isSquating = false
    @Published var squatCount = 0
    
    @Published var sound = UserDefaults.standard.bool(forKey: UserDefaultsKey.sound)
    @Published var vibrate = UserDefaults.standard.bool(forKey: UserDefaultsKey.vibrate)
    
    @Published var showAlert = false
    @Published var alertValues = AlertValues.empty()
    
    private var soundManagers = [SoundManager]()
    
    var goal = UserDefaults.standard.integer(forKey: UserDefaultsKey.goal)
    
    init(device: Device) {
        self.device = device
        if device == .iPhone {
            self.motionManager = iPhoneMotionManager()
        } else {
            self.motionManager = AirPodsMotionManager()
        }
        self.motionManager.startMotionUpdates()
        addSubscribers()
    }
    
    private func addSubscribers() {
        motionManager.accelerationSubject.sink { [weak self] acceleration in
            self?.detectSquat(acceleration: acceleration)
        }
        .store(in: &cancelBag)
        
        $sound.sink {
            UserDefaults.standard.set($0, forKey: UserDefaultsKey.sound)
        }
        .store(in: &cancelBag)
        
        $vibrate.sink {
            UserDefaults.standard.set($0, forKey: UserDefaultsKey.vibrate)
        }
        .store(in: &cancelBag)
    }
    
    private func detectSquat(acceleration: Double) {
        if squatCount == goal {
            finishSquat.send()
        }
        
        if acceleration > -1.1 {
            isSquating = true
        } else if acceleration < -0.7 {
            isSquating = false
            squatCount += 1
            haptic(.success)
            playSound()
        }
    }
    
    func didTapFinishButton() {
        showAlert = true
        alertValues = AlertValues(title: "종료하시겠습니까?", message: "")
        motionManager.stopMotionUpdates()
    }

    
    deinit {
        motionManager.stopMotionUpdates()
    }
}

extension SquatViewModel: SoundManagerDelegate {
        
    func playSound() {
        let sound = SoundManager()
        sound.delegate = self
        soundManagers.append(sound)
        sound.play()
    }
    
    func didFinishPlaying(_ soundManager: SoundManager) {
        if let index = soundManagers.firstIndex(of: soundManager) {
            soundManagers.remove(at: index)
        }
    }
}


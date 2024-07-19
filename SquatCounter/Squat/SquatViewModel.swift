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
    
    private let descendingThreshold = -0.003
    private let bottomThreshold = -0.001
    private let ascendingThreshold = 0.04
    
    private let motionManager: MotionManager
    private var cancelBag = Set<AnyCancellable>()
    private let startedTime = Date.now
    
    let finishSquatTrigger = PassthroughSubject<SquatResult, Never>()
    private let timerPublisher = Timer.publish(every: 1.0, on: .current, in: .common).autoconnect()
    
    var device: Device
    @Published var squatPhase: SquatPhase = .idle
    @Published var isSquating = false
    @Published var squatCount = 0
    
    @Published var sound = UserDefaults.standard.bool(forKey: UserDefaultsKey.sound)
    @Published var vibrate = UserDefaults.standard.bool(forKey: UserDefaultsKey.vibrate)
    
    @Published var showAlert = false
    @Published var alertValues = AlertValues.empty()
    
    private var soundManagers = [SoundManager]()
    private var duration: TimeInterval = 0
    
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
        
        $squatCount
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] count in
                guard let self = self else { return }
                if count >= self.goal {
                    finishSquat()
                }
            }
            .store(in: &cancelBag)
        
        timerPublisher.sink { [weak self] output in
            guard let self = self else { return }
            self.duration = output.timeIntervalSince(self.startedTime)
        }
        .store(in: &cancelBag)
    }
    
    private func detectSquat(acceleration: Double) {
        switch squatPhase {
         case .idle:
             if acceleration < descendingThreshold {
                 squatPhase = .descending
             }
         case .descending:
             if acceleration < bottomThreshold {
                 squatPhase = .bottom
             }
         case .bottom:
             if acceleration > ascendingThreshold {
                 squatPhase = .ascending
             }
         case .ascending:
             if acceleration < ascendingThreshold {
                 squatPhase = .idle
                 haptic(.success)
                 playSound()
                 squatCount += 1
             }
         }
    }
    
    func finishSquat() {
        motionManager.stopMotionUpdates()
        finishSquatTrigger.send(
            SquatResult(count: squatCount, duration: duration)
        )
    }
    
    func didTapFinishButton() {
        showAlert = true
        alertValues = AlertValues(title: R.string.localizable.confirmFinishWorkout(), message: "")
        motionManager.stopMotionUpdates()
    }
    
    func restartMotion() {
        motionManager.startMotionUpdates()
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


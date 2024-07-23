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
    
    let motionManager: MotionManager
    private var cancelBag = Set<AnyCancellable>()
    private let startedTime = Date.now
    
    let finishSquatTrigger = PassthroughSubject<SquatResult, Never>()
    private var timerCancellable: AnyCancellable?
    
    var device: Device
    var squatPhase: SquatPhase = .idle
    var isSquating = false
    @Published var squatCount = 0
    
    @Published var sound = UserDefaults.standard.bool(forKey: UserDefaultsKey.sound)
    @Published var vibrate = UserDefaults.standard.bool(forKey: UserDefaultsKey.vibrate)
    
    @Published var showAlert = false
    var alertValues = AlertValues.empty()
    
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
        
        $squatCount
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] count in
                guard let self = self else { return }
                if count >= self.goal {
                    finishSquat()
                }
            }
            .store(in: &cancelBag)
        
        timerCancellable = Timer.publish(every: 1.0, on: .current, in: .common).autoconnect()
            .sink { [weak self] output in
                guard let self = self else { return }
                self.duration = output.timeIntervalSince(self.startedTime)
            }
    }
    
    private func detectSquat(acceleration: Double) {
        print(acceleration, " ", squatPhase)
        switch squatPhase {
        case .idle:
            if acceleration < motionManager.descendingThreshold {
                squatPhase = .descending
            }
        case .descending:
            if acceleration < motionManager.bottomThreshold {
                squatPhase = .bottom
            }
        case .bottom:
            if acceleration > motionManager.ascendingThreshold {
                if vibrate {
                    haptic(.success)
                }
                squatPhase = .ascending
            }
        case .ascending:
            if acceleration < motionManager.ascendingThreshold {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.squatPhase = .idle
                    self.squatCount += 1
                    if self.sound {
                        self.playSound()
                    }
                }
            }
        }
    }
    
    func finishSquat() {
        motionManager.stopMotionUpdates()
        timerCancellable?.cancel()
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
        timerCancellable?.cancel()
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


//
//  SquatViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import Foundation
import Combine
import AVFoundation
import UIKit

final class SquatViewModel: ObservableObject {
    
    let motionManager: MotionManager
    var device: Device
    
    private var cancelBag = Set<AnyCancellable>()
    
    private var timerCancellable: AnyCancellable?
    private let startedTime = Date.now
    private var lastSqautTime = Date.now
    private var duration: TimeInterval = 0
    
    let finishSquatTrigger = PassthroughSubject<SquatResult, Never>()
    
    @Published var squatPhase: SquatPhase = .idle
    @Published var isSquating = false
    @Published var squatCount = 0
    var goal = UserDefaults.standard.integer(forKey: UserDefaultsKey.goal)
    
    @Published var sound = UserDefaults.standard.bool(forKey: UserDefaultsKey.sound)
    @Published var vibrate = UserDefaults.standard.bool(forKey: UserDefaultsKey.vibrate)
    private var soundManagers = [SoundManager]()
    
    @Published var showAlert = false
    var alertValues = AlertValues.empty()
    
    init(device: Device) {
        self.device = device
        
        if device == .iPhone {
            self.motionManager = iPhoneMotionManager()
        } else {
            self.motionManager = AirPodsMotionManager()
        }
        self.motionManager.startMotionUpdates()
        
        addSubscribers()
        addObservers()
    }
    
    private func addSubscribers() {
        $squatPhase.map {
            $0 == .descending || $0 == .bottom
        }.sink { [weak self] isSquating in
            self?.isSquating = isSquating
        }
        .store(in: &cancelBag)
        
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
    
    private func addObservers() {
        NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)
            .sink { [weak self] _ in
                self?.stopMotion()
            }
            .store(in: &cancelBag)
        
        NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)
            .sink { [weak self] _ in
                self?.restartMotion()
            }
            .store(in: &cancelBag)
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
                lastSqautTime = Date()
            }
        case .bottom:
            if acceleration > motionManager.ascendingThreshold {
                if vibrate {
                    haptic(.success)
                }
                squatPhase = .ascending
            }
        case .ascending:
            if acceleration < motionManager.ascendingThreshold && Date.now.timeIntervalSince(lastSqautTime) > motionManager.timeThreshhold {
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
        stopMotion()
    }
    
    func stopMotion() {
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


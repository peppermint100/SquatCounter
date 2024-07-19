//
//  HomeViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import Foundation
import Combine
import AVFAudio
import CoreMotion

final class HomeViewModel: ObservableObject {
    
    private var audioSession = AVAudioSession.sharedInstance()
    
    @Published var selectedDevice = Device.iPhone
    @Published var isMotionSensorAvailable = true
    @Published var isAirPodsAvailable = false
    @Published var airPodsName = ""
    @Published var disableStartButton = true
    
    var devices: [Device] = [.iPhone, .airPods]
    
    var cancelBag = Set<AnyCancellable>()
    
    init() {
        addSubscibers()
        NotificationCenter.default.addObserver(self, selector: #selector(audioRouteChanged), name: AVAudioSession.routeChangeNotification, object: audioSession)
        audioRouteChanged()
        updateMotionPermission()
    }
    
    private func addSubscibers() {
        Publishers.CombineLatest($selectedDevice, $isAirPodsAvailable).map { device, airPodsConnected in
            device == .airPods && !airPodsConnected
        }
        .assign(to: \.disableStartButton, on: self)
        .store(in: &cancelBag)
    }
    
    func switchDeivce(to device: Device) {
        selectedDevice = device
    }
    
    func settingButtonTapped() {
        OSLevelRedirection.redirectToAppSettings()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: AVAudioSession.routeChangeNotification, object: audioSession)
    }
}

// MARK: Motion {
extension HomeViewModel {
    
    func updateMotionPermission() {
        switch CMMotionActivityManager.authorizationStatus() {
        case .authorized:
            self.isMotionSensorAvailable = true
        default:
            self.isMotionSensorAvailable = false
        }
    }
}

// MARK: AirPods
extension HomeViewModel {
    
    @objc private func audioRouteChanged() {
        let currentRoute = audioSession.currentRoute
        for output in currentRoute.outputs {
            if output.portType == .bluetoothA2DP {
                DispatchQueue.main.async {
                    self.isAirPodsAvailable = true
                    self.airPodsName = output.portName
                }
                return
            }
        }
        
        DispatchQueue.main.async {
            self.isAirPodsAvailable = false
        }
    }
    
}

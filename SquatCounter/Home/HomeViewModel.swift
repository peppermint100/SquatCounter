//
//  HomeViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var selectedDevice = Device.iPhone
    @Published var isMotionSensorAvailable = true
    @Published var isAirPodsAvailable = true
    @Published var airPodsName = "Pepperpods"
    @Published var showSettingButton = false
    
    var devices: [Device] = [.iPhone, .airPods]
    
    var cancelBag = Set<AnyCancellable>()
    
    init() {
        addSubscibers()
    }
    
    private func addSubscibers() {
        // 아이폰인 경우 && 모션 불가능
        // 에어팟인 경우 모션 불가능
        // !에어팟인 경우 모션 가능
        
        $isMotionSensorAvailable.sink { [weak self] motion in
            guard let self = self else { return }
            
            if self.selectedDevice == .iPhone {
                showSettingButton = self.isMotionSensorAvailable
            } else if self.selectedDevice == .airPods {
                showSettingButton = self.isAirPodsAvailable || !self.isMotionSensorAvailable
            }
        }
        .store(in: &cancelBag)
    }
    
    func switchDeivce(to device: Device) {
        selectedDevice = device
    }
    
    func settingButtonTapped() {
        OSLevelRedrection.redirectToAppSettings()
    }
}

//
//  SettingViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/22/24.
//

import SwiftUI
import Combine
import DeviceKit

final class SettingViewModel: ObservableObject {
    
    @Published var currentSound = SoundType(rawValue: UserDefaults.standard.string(forKey: UserDefaultsKey.currentSound) ?? SoundType.marioJumping.rawValue)!
    @Published var sound = UserDefaults.standard.bool(forKey: UserDefaultsKey.sound)
    @Published var vibrate = UserDefaults.standard.bool(forKey: UserDefaultsKey.vibrate)
    
    @Published var iPhoneMotionSensitivity = SettingManager.getiPhoneMotionSensitivity()
    @Published var airPodsMotionSensitivity = SettingManager.getAirPodsMotionSensitivity()
    
    let sheetPresentTrigger = PassthroughSubject<SettingRouter.Sheet, Never>()
    
    private var cancelBag = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        $currentSound.sink {
            UserDefaults.standard.setValue($0.rawValue, forKey: UserDefaultsKey.currentSound)
        }
        .store(in: &cancelBag)
        
        $sound.sink {
            UserDefaults.standard.setValue($0, forKey: UserDefaultsKey.sound)
        }
        .store(in: &cancelBag)
        
        $vibrate.sink {
            UserDefaults.standard.setValue($0, forKey: UserDefaultsKey.vibrate)
        }
        .store(in: &cancelBag)
        
        $iPhoneMotionSensitivity.sink {
            UserDefaults.standard.setValue($0.rawValue, forKey: UserDefaultsKey.iPhoneMotionSensitivity)
        }
        .store(in: &cancelBag)
        
        $airPodsMotionSensitivity.sink {
            UserDefaults.standard.setValue($0.rawValue, forKey: UserDefaultsKey.airPodsMotionSensitivity)
        }
        .store(in: &cancelBag)
    }
    
    func didTapContactDeveloper() {
        if let mailtoURL = createMailtoURL() {
            if UIApplication.shared.canOpenURL(mailtoURL) {
                UIApplication.shared.open(mailtoURL)
            } else {
                sheetPresentTrigger.send(.contactDeveloper)
            }
        }
    }
    
    func didTapPrivacyPolicy() {
        sheetPresentTrigger.send(.privacyPolicy)
    }
}

// MARK: Email
extension SettingViewModel {
    
    func createMailtoURL() -> URL? {
        let developerEmail = "krpeppermint100@gmail.com"
        let subject = "Contact Email Support"
        let urlString = "mailto:\(developerEmail)?subject=\(subject)&body=\(generateBody())"
        return URL(string: urlString)
    }
    
    func generateBody() -> String {
        return String("""
                Application Name: \(Bundle.main.displayName)
                iOS: \(UIDevice.current.systemVersion)
                Device Model: \(DeviceKit.Device.current)
                App Version: \(Bundle.main.appVersion)
                App Build: \(Bundle.main.appBuild)
            --------------------------------------
            """
        )
    }
}

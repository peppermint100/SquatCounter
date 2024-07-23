//
//  SettingViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/22/24.
//

import SwiftUI
import Combine

final class SettingViewModel: ObservableObject {
    
    @Published var currentSound = SoundType(rawValue: UserDefaults.standard.string(forKey: UserDefaultsKey.currentSound) ?? SoundType.marioJumping.rawValue)!
    @Published var sound = UserDefaults.standard.bool(forKey: UserDefaultsKey.sound)
    @Published var vibrate = UserDefaults.standard.bool(forKey: UserDefaultsKey.vibrate)
    
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
    }
}

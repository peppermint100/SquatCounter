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
    
    private var cancelBag = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        $currentSound.sink {
            UserDefaults.standard.setValue($0.rawValue, forKey: UserDefaultsKey.currentSound)
        }
        .store(in: &cancelBag)
    }
}

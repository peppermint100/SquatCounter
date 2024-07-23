//
//  SoundSettingViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/22/24.
//

import SwiftUI

final class SoundSettingViewModel: ObservableObject {
    
    private var soundManagers = [SoundManager]()
    
    func playSound(_ type: SoundType) {
        let soundManager = SoundManager(type)
        soundManager.play()
        soundManagers.append(soundManager)
    }
}

extension SoundSettingViewModel: SoundManagerDelegate {
    func didFinishPlaying(_ soundManager: SoundManager) {
        if let index = soundManagers.firstIndex(of: soundManager) {
            soundManagers.remove(at: index)
        }
    }
}

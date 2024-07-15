//
//  SoundManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/14/24.
//

import Foundation
import AVFoundation

enum SoundType: String {
    case marioJumping = "MarioJumping"
}

protocol SoundManagerDelegate: AnyObject {
    func didFinishPlaying(_ soundManager: SoundManager)
}

final class SoundManager: NSObject {
    
    weak var delegate: SoundManagerDelegate?
    private var soundPlayer: AVAudioPlayer?
    
    override init() {
        let currentSoundDefaults = UserDefaults.standard.string(forKey: UserDefaultsKey.currentSound) ?? SoundType.marioJumping.rawValue
        let currentSound = SoundType(rawValue: currentSoundDefaults)
        
        let url = Bundle.main.url(forResource: currentSound?.rawValue, withExtension: "mp3")!

        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.prepareToPlay()
        } catch let error {
            print(#file, #function, error.localizedDescription)
        }
    }
    
    func play() {
        soundPlayer?.play()
    }
}

extension SoundManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        delegate?.didFinishPlaying(self)
    }
}

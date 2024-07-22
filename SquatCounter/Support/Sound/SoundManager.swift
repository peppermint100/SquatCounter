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
    case blop = "Blop"
    case correct1 = "Correct1"
    case correct2 = "Correct2"
    case jumpHigh = "JumpHigh"
    case stapler = "Stapler"
    case woosh = "Woosh"
}

protocol SoundManagerDelegate: AnyObject {
    func didFinishPlaying(_ soundManager: SoundManager)
}

final class SoundManager: NSObject {
    
    weak var delegate: SoundManagerDelegate?
    private var soundPlayer: AVAudioPlayer?
    
    override init() {
        super.init()
        let currentSoundDefaults = UserDefaults.standard.string(forKey: UserDefaultsKey.currentSound) ?? SoundType.marioJumping.rawValue
        let currentSound = SoundType(rawValue: currentSoundDefaults)
        
        let url = Bundle.main.url(forResource: currentSound?.rawValue, withExtension: "mp3")!
        
        self.initSoundPlayer(with: url)
    }
    
    convenience init(_ type: SoundType) {
        let currentSound = SoundType(rawValue: type.rawValue)
        let url = Bundle.main.url(forResource: currentSound?.rawValue, withExtension: "mp3")!
        self.init()
        self.initSoundPlayer(with: url)
    }
    
    private func initSoundPlayer(with url: URL) {
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.prepareToPlay()
        } catch let error {
            print(#file, #function, error.localizedDescription)
        }
    }
    
    func play() {
        if UserDefaults.standard.bool(forKey: UserDefaultsKey.sound) {
            soundPlayer?.play()
        }
    }
}

extension SoundManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        delegate?.didFinishPlaying(self)
    }
}

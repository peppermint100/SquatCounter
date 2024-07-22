//
//  SoundManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/14/24.
//

import Foundation
import AVFoundation

enum SoundType: String, CaseIterable, Identifiable {
    case marioJumping = "MarioJumping"
    case blop = "Blop"
    case correct1 = "Correct1"
    case correct2 = "Correct2"
    case jumpHigh = "JumpHigh"
    case stapler = "Stapler"
    case woosh = "Woosh"
    
    var id: String {
        self.rawValue
    }
    
    var title: String {
        switch self {
        case .marioJumping:
            R.string.localizable.marioJumping()
        case .blop:
            R.string.localizable.blop()
        case .correct1:
            R.string.localizable.correct1()
        case .correct2:
            R.string.localizable.correct2()
        case .jumpHigh:
            R.string.localizable.jumpHigh()
        case .stapler:
            R.string.localizable.stapler()
        case .woosh:
            R.string.localizable.woosh()
        }
    }
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
            try AVAudioSession.sharedInstance().setCategory(.playback)
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

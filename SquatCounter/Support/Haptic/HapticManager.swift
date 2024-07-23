//
//  HapticManager.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/14/24.
//

import UIKit

fileprivate final class HapticManager {
    static let shared = HapticManager()
    private init() {}
    
    private let feedback = UINotificationFeedbackGenerator()
    
    func trigger(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
        feedback.notificationOccurred(notification)
    }
}

func haptic(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
    HapticManager.shared.trigger(notification)
}

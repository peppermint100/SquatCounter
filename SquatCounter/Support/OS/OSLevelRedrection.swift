//
//  OSLevelRedrection.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/11/24.
//

import UIKit

final class OSLevelRedrection {
    
    static func redirectToAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

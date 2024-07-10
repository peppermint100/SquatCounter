//
//  SquatCounterApp.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/9/24.
//

import SwiftUI

@main
struct SquatCounterApp: App {
    
    @AppStorage(UserDefaultsKey.hasUserOnBoarded) private var hasUserOnBoarded = UserDefaults.standard.bool(forKey: UserDefaultsKey.hasUserOnBoarded)
    
    var body: some Scene {
        WindowGroup {
            if hasUserOnBoarded {
                ContentView()
            } else {
                OnBoardingView()
            }
        }
    }
}

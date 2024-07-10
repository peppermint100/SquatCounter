//
//  MainView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage(UserDefaultsKey.hasUserOnBoarded) private var hasUserOnBoarded = UserDefaults.standard.bool(forKey: UserDefaultsKey.hasUserOnBoarded)
    @StateObject private var onBoardingVM = OnBoardingViewModel()
    
    var body: some View {
        if hasUserOnBoarded {
            ContentView()
        } else {
            OnBoardingView(vm: onBoardingVM)
                .onReceive(onBoardingVM.nextButtonSubject) {
                    hasUserOnBoarded = true
                }
        }
    }
}

#Preview {
    MainView()
}

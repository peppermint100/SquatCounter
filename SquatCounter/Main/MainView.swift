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
    @StateObject private var mainVM = MainViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(R.color.backgroundColor.color)
    }
    
    var body: some View {
        if hasUserOnBoarded {
            TabView(selection: $mainVM.selectedTab) {
                HomeView()
                    .tabItem {
                        Symbols.figureCrossTraining
                        Text(R.string.localizable.home)
                    }
                    .tag(0)
                
                SettingView()
                    .tabItem {
                        Symbols.gear
                        Text(R.string.localizable.setting)
                    }
                    .tag(1)
            }
            .tint(.black)
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

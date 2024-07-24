//
//  SoundSettingView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/22/24.
//

import SwiftUI

struct SoundSettingView: View {
    
    @EnvironmentObject private var router: SettingRouter
    @Binding var sound: SoundType
    var soundManagers = [SoundManager]()
    @StateObject private var vm = SoundSettingViewModel()
    
    var body: some View {
        ZStack {
            R.color.backgroundColor.color
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    InlineNavigationBar(title: R.string.localizable.soundSetting(), router: router)
                    
                    VStack {
                        ForEach(SoundType.allCases) { soundType in
                            HStack {
                                Symbols.checkMark
                                    .opacity(soundType == sound ? 1.0 : 0)
                                Text(soundType.title)
                                Spacer()
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                sound = soundType
                                vm.playSound(soundType)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 4)
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    SoundSettingView(sound: .constant(.blop))
        .environmentObject(SettingRouter())
}

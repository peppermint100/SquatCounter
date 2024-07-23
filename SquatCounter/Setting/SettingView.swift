//
//  SettingView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import SwiftUI

struct SettingView: View {
    
    @StateObject private var router = SettingRouter()
    @StateObject private var vm = SettingViewModel()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                R.color.backgroundColor.color
                    .ignoresSafeArea()
                
                GeometryReader { geo in
                    VStack {
                        LargeTitleNavigationBar(title: R.string.localizable.setting())
                        
                        VStack {
                            SettingItemNavigationRowView(title: R.string.localizable.soundSetting(), selectedOption: vm.currentSound.title)
                                .onTapGesture {
                                    router.push(.sound($vm.currentSound))
                                }
                            soundFeedback
                            hapticFeedback
                        }
                        .padding()
                    }
                }
            }
            .navigationDestination(for: SettingRouter.Page.self) { page in
                router.build(page)
            }
        }
    }
}

private extension SettingView {
    
    var soundFeedback: some View {
        HStack {
            Text(R.string.localizable.soundFeedback)
                .fontWeight(.medium)
                .foregroundStyle(.black)
            Spacer()
            Toggle(isOn: $vm.sound, label: {})
                .tint(.black)
        }
    }
    
    var hapticFeedback: some View {
        HStack {
            Text(R.string.localizable.hapticFeedback)
                .fontWeight(.medium)
                .foregroundStyle(.black)
            Spacer()
            Toggle(isOn: $vm.vibrate, label: {})
                .tint(.black)
        }
    }
}

#Preview {
    SettingView()
}

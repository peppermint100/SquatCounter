//
//  SensitivitySettingView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/23/24.
//

import SwiftUI

struct SensitivitySettingView: View {
    
    @EnvironmentObject private var router: SettingRouter
    @Binding private var motionSensitivity: MotionSensitivity
    private let device: Device
    
    init(device: Device, motionSensitivity: Binding<MotionSensitivity>) {
        self.device = device
        self._motionSensitivity = motionSensitivity
    }
    
    var body: some View {
        ZStack {
            R.color.backgroundColor.color.ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    InlineNavigationBar(
                        title: device == .iPhone ? R.string.localizable.iPhoneMotionSensitivity() : R.string.localizable.airPodsMotionSensitivity(),
                        router: router)
                    
                    VStack {
                        ForEach(MotionSensitivity.allCases) { option in
                            HStack {
                                Symbols.checkMark
                                    .opacity(motionSensitivity == option ? 1.0 : 0)
                                Text(option.title)
                                Spacer()
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                motionSensitivity = option
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 4)
                        }
                    }
                    .padding()
                    
                    VStack(spacing: 15) {
                        Text(R.string.localizable.sensitivityDescription)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        
                        if device == .airPods {
                            Text(R.string.localizable.supportedHeaphonesDescription)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                    .multilineTextAlignment(.center)
                    .frame(width: geo.size.width * 0.9)
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
    SensitivitySettingView(device: .airPods, motionSensitivity: .constant(.medium))
        .environmentObject(SettingRouter())
}

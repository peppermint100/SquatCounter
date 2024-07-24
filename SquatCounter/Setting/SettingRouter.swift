//
//  SettingRouter.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/22/24.
//

import SwiftUI
import Combine

final class SettingRouter: ObservableObject, Router {
    
    @Published var path = NavigationPath()
    
    enum Page: Hashable {
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.hashValue)
        }
        
        static func == (lhs: SettingRouter.Page, rhs: SettingRouter.Page) -> Bool {
            switch (lhs, rhs) {
            case let (.sound(lhsItem), .sound(rhsItem)):
                return lhsItem.wrappedValue.rawValue == rhsItem.wrappedValue.rawValue
            case let (.sensitivity(lhs1, lhs2), .sensitivity(rhs1, rhs2)):
                return lhs1.rawValue == rhs1.rawValue && lhs2.wrappedValue.rawValue == rhs2.wrappedValue.rawValue
            default:
                return true
            }
        }
        
        case sound(Binding<SoundType>)
        case sensitivity(device: Device, motionSensitivity: Binding<MotionSensitivity>)
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .sound(let sound):
            SoundSettingView(sound: sound)
                .environmentObject(self)
        case .sensitivity(let device, let motionSensitivity):
            SensitivitySettingView(device: device, motionSensitivity: motionSensitivity)
                .environmentObject(self)
        }
    }
}

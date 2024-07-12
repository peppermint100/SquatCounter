//
//  SquatView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import SwiftUI

struct SquatView: View {
    
    @ObservedObject private var vm: SquatViewModel
    
    init(device: Device) {
        if device == .iPhone {
            self.vm = SquatViewModel(motionManager: iPhoneMotionManager())
        } else {
            self.vm = SquatViewModel(motionManager: AirPodsMotionManager())
        }
    }
    
    var body: some View {
        Text("Squat")
    }
}

#Preview {
    SquatView(device: .iPhone)
}

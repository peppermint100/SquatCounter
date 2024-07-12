//
//  DeviceTabItemView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import SwiftUI

struct DeviceTabItemView: View {
    
    let device: Device
    var isSelected: Bool
    
    var body: some View {
        Text(device.name)
            .font(.callout)
            .fontWeight(Font.Weight.light)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .foregroundStyle(isSelected ? .white : .black)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? .black : .clear)
                    .stroke(.black, lineWidth: 1.2)
            )
    }
}

#Preview {
    HStack {
        DeviceTabItemView(
            device: .iPhone,
            isSelected: true
        )
        
        DeviceTabItemView(
            device: .airPods,
            isSelected: false
        )
    }
}

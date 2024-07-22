//
//  SettingItemNavigationRowView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/22/24.
//

import SwiftUI

struct SettingItemNavigationRowView: View {
    
    let title: String
    var selectedOption: String
    
    var body: some View {
        HStack {
            Text(R.string.localizable.soundSetting)
                .fontWeight(.medium)
                .foregroundStyle(.black)
            Spacer()
            Text(selectedOption)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
            Symbols.chevronRight
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
}

#Preview {
    VStack {
        SettingItemNavigationRowView(
            title: "사운드 설정",
            selectedOption: "래틀"
        )
        
        SettingItemNavigationRowView(
            title: "사운드 설정",
            selectedOption: "래틀"
        )
        
        SettingItemNavigationRowView(
            title: "사운드 설정",
            selectedOption: "래틀"
        )
    }
    .padding()
}

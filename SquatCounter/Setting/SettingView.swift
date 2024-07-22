//
//  SettingView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import SwiftUI

struct SettingView: View {
    
    var body: some View {
        ZStack {
            R.color.backgroundColor.color
            
            GeometryReader { geo in
                VStack {
                    navigationBar
                }
            }
        }
    }
}

private extension SettingView {
    var navigationBar: some View {
        HStack {
            Text(R.string.localizable.setting)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(20)
    }
}

#Preview {
    SettingView()
}

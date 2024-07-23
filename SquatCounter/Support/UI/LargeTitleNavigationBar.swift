//
//  LargeTitleNavigationBar.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/23/24.
//

import SwiftUI

struct LargeTitleNavigationBar: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

#Preview {
    LargeTitleNavigationBar(title: "설정")
}

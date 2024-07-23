//
//  InlineNavigationBar.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/23/24.
//

import SwiftUI

struct InlineNavigationBar: View {
    
    let title: String
    let router: Router
    
    var body: some View {
        ZStack {
            HStack {
                Symbols.chevronLeft
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.semibold)
                    .padding(.trailing, 20)
                    .background(Color.clear.contentShape(Rectangle()))
                    .onTapGesture {
                        router.pop()
                    }
                Spacer()
            }
            .padding(.horizontal)
            
            HStack {
                Text(title)
                    .font(.headline)
            }
        }
        .padding(5)
    }
}

#Preview {
    InlineNavigationBar(title: "설정", router: HomeRouter())
}

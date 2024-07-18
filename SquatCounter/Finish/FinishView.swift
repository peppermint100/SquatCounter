//
//  FinishView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/14/24.
//

import SwiftUI

struct FinishView: View {
    
    @EnvironmentObject private var router: HomeRouter
    
    var body: some View {
        VStack {
            Text("123")
                .onTapGesture {
                    router.root()
                }
        }
    }
}

#Preview {
    FinishView()
}

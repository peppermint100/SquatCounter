//
//  ContentView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(Color(uiColor: R.color.accentColor()!))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

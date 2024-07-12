//
//  BorderedButton.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/11/24.
//

import SwiftUI

struct BorderedButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundStyle(.black)
            RoundedRectangle(cornerRadius: 8)
                .fill(.clear)
                .stroke(.black, lineWidth: 1.0)
            
        }
    }
}

extension View {
    func borderedButton() -> some View {
        self.modifier(BorderedButtonModifier())
    }
}

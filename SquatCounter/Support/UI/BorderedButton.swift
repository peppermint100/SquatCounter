//
//  BorderedButton.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/11/24.
//

import SwiftUI

struct BorderedButtonModifier: ViewModifier {
    
    let disabled: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundStyle(.black)
            RoundedRectangle(cornerRadius: 8)
                .fill(.clear)
                .stroke(disabled ? .gray : .black, lineWidth: 1.0)
        }
    }
}

extension View {
    func borderedButton(disabled: Bool = false) -> some View {
        self.modifier(BorderedButtonModifier(disabled: disabled))
    }
}

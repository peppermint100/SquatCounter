//
//  PrivacyPolicyView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/25/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ZStack {
            R.color.backgroundColor.color.ignoresSafeArea()
            Text(R.string.localizable.privacyPolicyDescription)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    PrivacyPolicyView()
}

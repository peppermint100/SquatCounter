//
//  ContactDeveloperView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/25/24.
//

import SwiftUI

struct ContactDeveloperView: View {
    var body: some View {
        ZStack {
            R.color.backgroundColor.color.ignoresSafeArea()
            Text(R.string.localizable.emailAppDoesNotExist)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    ContactDeveloperView()
}

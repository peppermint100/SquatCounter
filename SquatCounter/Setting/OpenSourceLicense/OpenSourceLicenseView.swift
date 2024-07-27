//
//  OpenSourceLicenseView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/27/24.
//

import SwiftUI

struct OpenSourceLicenseView: View {
    var body: some View {
        ZStack {
            R.color.backgroundColor.color.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(R.string.localizable.openSourceLicense)
                    .font(.headline)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button(action: {
                    openURL(urlString: "https://github.com/devicekit/DeviceKit")
                }, label: {
                   Text("DeviceKit")
                })
                
                Button(action: {
                    openURL(urlString: "https://github.com/mac-cain13/R.swift")
                }, label: {
                        Text("R.Swift")
                })
                
                Button(action: {
                    openURL(urlString: "https://www.flaticon.com/kr/free-icons")
                }, label: {
                        Text("AppIcon")
                })
                
                Spacer()
            }
            .padding()
        }
    }
    
    private func openURL(urlString: String) {
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

#Preview {
    OpenSourceLicenseView()
}

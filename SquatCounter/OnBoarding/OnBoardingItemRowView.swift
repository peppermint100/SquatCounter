//
//  OnBoardingItemRowView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import SwiftUI

struct OnBoardingItemRowView: View {
    
    let geo: GeometryProxy
    let image: Image
    let title: String
    let description: String
    
    var body: some View {
        let imageSize = geo.size.width * 0.07
        
        HStack(alignment: .top, spacing: 15) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize)
                .padding(10)
                .foregroundStyle(.black)
                .background(
                    Circle().fill(R.color.backgroundColor.color)
                        .stroke(Color.black, lineWidth: 1.0)
                )
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.black)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.descriptionLabel)
            }
            Spacer()
        }
    }
}

#Preview {
    GeometryReader { geo in
        OnBoardingItemRowView(
            geo: geo,
            image: Symbols.figureCooldown,
            title: "블루투스",
            description: "에어팟과 운동할 때 에어팟의 연결 여부 확인을 위해 권한이 필요합니다."
        )
    }
}

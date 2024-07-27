//
//  OnBoardingView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import SwiftUI

struct OnBoardingView: View {
    
    @ObservedObject private var vm: OnBoardingViewModel
    
    init(vm: OnBoardingViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        ZStack {
            R.color.backgroundColor.color
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack(spacing: 40) {
                    title
                    
                    Divider()
                    
                    OnBoardingItemRowView(
                        geo: geo,
                        image: Symbols.figureCooldown,
                        title: R.string.localizable.motionSensor(),
                        description: R.string.localizable.motionSensorDescription())
                    
                    Spacer()
                    
                    nextButton(geo: geo)
                }
                .padding()
            }
        }
    }
}

#Preview {
    OnBoardingView(vm: OnBoardingViewModel())
}

private extension OnBoardingView {
    
    var title: some View {
        Text(R.string.localizable.onboardingPermissionTitle())
            .font(.title3)
            .fontWeight(Font.Weight.bold)
            .padding(.top)
    }
    
    func nextButton(geo: GeometryProxy) -> some View {
        Button(action: {
            vm.nextButtonTapped()
        }, label: {
            Text(R.string.localizable.next())
                .foregroundColor(.black)
                .frame(width: geo.size.width * 0.8, height: 50)
                .font(.headline)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1.5)
                )
        })
    }
}

//
//  SquatView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import SwiftUI
import AVFoundation

struct SquatView: View {
    
    @EnvironmentObject private var router: HomeRouter
    @ObservedObject private var vm: SquatViewModel
    
    init(device: Device) {
        self.vm = SquatViewModel(device: device)
    }
    
    var body: some View {
        ZStack {
            R.color.backgroundColor.color
                .ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    let iconSize = geo.size.width * 0.08
                    
                    navigationBar(iconSize: iconSize)
                    
                    Spacer()
                    
                    HStack {
                        Text("\(vm.squatCount) / \(vm.goal)")
                            .font(.largeTitle)
                            .fontWeight(Font.Weight.bold)
                    }
                    
                    Text(
                        vm.device == .iPhone
                        ? R.string.localizable.iPhoneMotionSensorDescription
                        : R.string.localizable.airpodsMotionSensorDescription
                    )
                    .font(.headline)
                    .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Text(R.string.localizable.finishWorkout)
                        .borderedButton()
                        .frame(width: geo.size.width * 0.7, height: 40)
                        .padding()
                        .onTapGesture {
                            vm.didTapFinishButton()
                        }
                }
            }
            .padding(.horizontal)
            .onReceive(vm.finishSquat, perform: { _ in
                router.push(.finish)
            })
            .alert(isPresented: $vm.showAlert) {
                Alert(
                    title: Text(vm.alertValues.title),
                    primaryButton: .destructive(Text(R.string.localizable.finish), action: {
                        router.pop()
                    }),
                    secondaryButton: .cancel())
            }
            .toolbar(.hidden, for: .navigationBar)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    SquatView(device: .iPhone)
}

private extension SquatView {
    func navigationBar(iconSize: CGFloat) -> some View {
        HStack {
            Spacer()
            if vm.sound {
                Symbols.speaker
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconSize, height: iconSize)
                    .onTapGesture {
                        vm.sound.toggle()
                    }
            } else {
                Symbols.speakerSlash
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconSize, height: iconSize)
                    .onTapGesture {
                        vm.sound.toggle()
                    }
            }
            
            if vm.vibrate {
                Symbols.iPhone
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconSize, height: iconSize)
                    .onTapGesture {
                        vm.vibrate.toggle()
                    }
            } else {
                Symbols.iPhoneSlash
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconSize, height: iconSize)
                    .onTapGesture {
                        vm.vibrate.toggle()
                    }
            }
        }
    }
}

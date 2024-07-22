//
//  SquatView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import SwiftUI

struct SquatView: View {
    
    @EnvironmentObject private var router: HomeRouter
    @StateObject private var vm: SquatViewModel
    
    init(device: Device) {
        _vm = StateObject(wrappedValue: SquatViewModel(device: device))
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
                    
                    Button(action: {
                        vm.didTapFinishButton()
                    }, label: {
                        Text(R.string.localizable.finishWorkout)
                            .borderedButton()
                            .frame(width: geo.size.width * 0.7, height: 40)
                            .padding()
                        
                    })
                }
            }
            .padding(.horizontal)
            .onReceive(vm.finishSquatTrigger, perform: { result in
                router.push(.finish(result))
            })
            .alert(isPresented: $vm.showAlert) {
                Alert(
                    title: Text(vm.alertValues.title),
                    primaryButton: .destructive(Text(R.string.localizable.finish), action: {
                        vm.finishSquat()
                    }),
                    secondaryButton: .cancel({
                        vm.restartMotion()
                    }))
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

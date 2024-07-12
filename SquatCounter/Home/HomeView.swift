//
//  HomeView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        ZStack {
            R.color.backgroundColor.color
                .ignoresSafeArea()
            
            GeometryReader { geo in
                let imageSize = geo.size.width * 0.18
                let buttonWidth = geo.size.width * 0.4
                let buttonHeight: CGFloat = 40
                let settingButtonSize = CGSize(width: geo.size.width * 0.8, height: buttonHeight)
                
                VStack(alignment: .leading) {
                    chooseDevice
                    devicesTab
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Spacer()
                            if vm.selectedDevice == .iPhone {
                                iPhoneWorkout(imageSize: imageSize)
                            } else {
                                airPodsWorkout(imageSize: imageSize)
                            }
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    
                    if !vm.showSettingButton {
                        HStack {
                            Spacer()
                            settingButton(buttonSize: settingButtonSize)
                            Spacer()
                        }
                    } else {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(R.string.localizable.setGoal)
                                .borderedButton()
                                .frame(width: buttonWidth, height: buttonHeight)
                            Spacer()
                            Text(R.string.localizable.start)
                                .borderedButton()
                                .frame(width: buttonWidth, height: buttonHeight)
                            Spacer()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}

private extension HomeView {
    
    var chooseDevice: some View {
        Text(R.string.localizable.chooseYourDevice)
            .font(.title2)
            .fontWeight(Font.Weight.bold)
    }
    
    var devicesTab: some View {
        HStack(spacing: 15) {
            ForEach(vm.devices) { device in
                DeviceTabItemView(
                    device: device,
                    isSelected: vm.selectedDevice == device)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        vm.switchDeivce(to: device)
                    }
                }
            }
        }
    }
    
    func settingButton(buttonSize: CGSize) -> some View {
        Button(action: {
            vm.settingButtonTapped()
        }, label: {
            Text("설정")
                .borderedButton()
                .frame(width: buttonSize.width, height: buttonSize.height)
        })
        .padding()
    }
    
    func iPhoneWorkout(imageSize: CGFloat) -> some View {
        VStack {
            Symbols.figureCooldown
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(vm.isMotionSensorAvailable ? .black : .lightGray)
                .frame(width: imageSize)
            
            if vm.isMotionSensorAvailable {
                Text(R.string.localizable.iPhoneMotionSensorHeadline)
                    .font(.headline)
                Text(R.string.localizable.iPhoneMotionSensorDescription)
                    .font(.caption)
                    .foregroundStyle(.gray)
            } else {
                Text(R.string.localizable.iPhoneMotionSensorHeadline)
                    .font(.headline)
                Text(R.string.localizable.motionFitnessPermissionHeadline)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    func airPodsWorkout(imageSize: CGFloat) -> some View {
        VStack {
            Symbols.airPods
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(vm.isMotionSensorAvailable && vm.isAirPodsAvailable ? .black : .lightGray)
                .frame(width: imageSize)
            
            if vm.isAirPodsAvailable {
                Text(vm.airPodsName)
                    .font(.headline)
            } else {
                Text(R.string.localizable.noAirPodsConnected)
                    .font(.headline)
            }
            
            if vm.isAirPodsAvailable && vm.isMotionSensorAvailable {
                Text(R.string.localizable.airpodsMotionSensorDescription)
                    .font(.caption)
                    .foregroundStyle(.gray)
            } else if vm.isAirPodsAvailable && !vm.isMotionSensorAvailable {
                Text(R.string.localizable.motionFitnessPermissionDescription)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
        }
    }
}

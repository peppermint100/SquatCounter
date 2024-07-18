//
//  FinishView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/14/24.
//

import SwiftUI

struct FinishView: View {
    
    @EnvironmentObject private var router: HomeRouter
    @ObservedObject private var vm: FinishViewModel
    
    @State private var trim: CGFloat = 0.0
    
    @State private var animate = false
    
    init(result: SquatResult) {
        self.vm = FinishViewModel(result: result)
    }
    
    var body: some View {
        ZStack {
            R.color.backgroundColor.color
                .ignoresSafeArea()
            
            GeometryReader { geo in
                let circleSize = geo.size.width * 0.7
                let buttonWidth = geo.size.width * 0.7
                
                VStack {
                    Spacer()
                    progress(circleSize: circleSize)
                        .frame(height: geo.size.height * 0.5)
                    Spacer()
                    results
                    Spacer()
                    button(buttonWidth: buttonWidth)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    FinishView(result: SquatResult(count: 10, duration: 10000))
}

private extension FinishView {
    func progress(circleSize: CGFloat) -> some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 35)
                .frame(width: circleSize)
            
            Circle()
                .trim(from: 0, to: trim)
                .stroke(R.color.backgroundColor.color, style: StrokeStyle(lineWidth: 25, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .frame(width: circleSize)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        trim = CGFloat(Double(vm.result.count) / Double(vm.goal))
                    }
                }
            
            Circle()
                .stroke(lineWidth: 1)
                .scale(animate ? 1.5 : 1.1)
                .opacity(animate ? 0 : 1)
                .animation(animate ? Animation.easeInOut(duration: 1.0) : .none)
                .frame(width: circleSize)
                .onAppear {
                    if vm.goal == vm.result.count {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            animate = true
                        }
                    }
                }
            
            Text("\(vm.result.count) / \(vm.goal)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
    
    var results: some View {
        
        HStack {
            Spacer()
            
            VStack {
                Text(vm.interval)
                    .font(.title)
                    .fontWeight(.bold)
                Text(R.string.localizable.interval)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            VStack {
                Text(vm.duration)
                    .font(.title)
                    .fontWeight(.bold)
                Text(R.string.localizable.time)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
    }
    
    func button(buttonWidth: CGFloat) -> some View {
        Button(
            action: { router.root() },
            label: {
                Text(R.string.localizable.return)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .borderedButton()
                    .frame(width: buttonWidth, height: 40)
            })
        .padding(.bottom, 20)
    }
}

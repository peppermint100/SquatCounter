//
//  SetGoalSheetView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import SwiftUI

struct SetGoalSheetView: View {
    
    @EnvironmentObject private var router: HomeRouter
    @State private var goal = UserDefaults.standard.integer(forKey: UserDefaultsKey.goal)
    private let goals = [1, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    
    var body: some View {
        ZStack {
            R.color.backgroundColor.color
                .ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    Picker("", selection: $goal) {
                        ForEach(goals, id: \.self) { goal in
                            Text("\(goal)")
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Button(action: {
                        UserDefaults.standard.setValue(goal, forKey: UserDefaultsKey.goal)
                        router.dismiss()
                    }, label: {
                        Text(R.string.localizable.confirm)
                            .font(.headline)
                            .fontWeight(.regular)
                            .borderedButton()
                            .frame(width: geo.size.width * 0.6, height: 40)
                    })
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .sheet(isPresented: .constant(true), content: {
            SetGoalSheetView()
                .presentationDetents([.fraction(0.3)])
        })
}

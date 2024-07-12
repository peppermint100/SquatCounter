//
//  SetGoalSheetView.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import SwiftUI

struct SetGoalSheetView: View {
    
    @EnvironmentObject private var router: HomeRouter
    @AppStorage(UserDefaultsKey.goal) private var goal = UserDefaults.standard.integer(forKey: UserDefaultsKey.goal)
    private let goals = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    
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

//
//  HomeRouter.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import SwiftUI

final class HomeRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet? = nil
    
    enum Page: Hashable {
        case squat(device: Device)
        case finish
    }
    
    enum Sheet: String, Identifiable {
        case setGoal
        
        var id: String {
            self.rawValue
        }
    }
    
    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func dismiss() {
        self.sheet = nil
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func root() {
        while !path.isEmpty {
            path.removeLast()
        }
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .squat(let device):
            SquatView(device: device)
                .environmentObject(self)
        case .finish:
            FinishView()
                .environmentObject(self)
        }
    }
    
    @ViewBuilder
    func build(_ sheet: Sheet) -> some View {
        switch sheet {
        case .setGoal:
            SetGoalSheetView()
                .presentationDetents([.fraction(0.3)])
                .environmentObject(self)
        }
    }
}

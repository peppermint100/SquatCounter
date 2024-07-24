//
//  HomeRouter.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import SwiftUI

final class HomeRouter: ObservableObject, Router {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet? = nil
    
    enum Page: Hashable {
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.hashValue)
        }
        
        static func == (lhs: HomeRouter.Page, rhs: HomeRouter.Page) -> Bool {
            switch (lhs, rhs) {
            case let (.finish(lhsItem), .finish(rhsItem)):
                return lhsItem.id == rhsItem.id
            default:
                return true
            }
        }
        
        case squat(device: Device)
        case finish(_ result: SquatResult)
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
        case .finish(let result):
            FinishView(result: result)
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

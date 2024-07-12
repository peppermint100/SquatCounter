//
//  HomeRouter.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/12/24.
//

import SwiftUI

final class HomeRouter: ObservableObject {
    
    @Published var sheet: Sheet? = nil
    
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

//
//  FinishViewModel.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/18/24.
//

import Foundation

final class FinishViewModel: ObservableObject {
    
    let result: SquatResult
    let goal = UserDefaults.standard.integer(forKey: UserDefaultsKey.goal)
    
    var interval: String {
        "\(TimeInterval(Double(result.count) / result.duration).formatAsPace())\""
    }
    
    var duration: String {
        result.duration.formatForTimer()
    }
    
    init(result: SquatResult) {
        self.result = result
    }
}

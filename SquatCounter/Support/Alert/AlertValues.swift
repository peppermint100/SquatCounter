//
//  AlertValues.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/14/24.
//

import Foundation

struct AlertValues {
    let title: String
    let message: String
    
    static func empty() -> Self {
        return AlertValues(title: "", message: "")
    }
}

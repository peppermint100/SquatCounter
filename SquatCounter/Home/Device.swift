//
//  Device.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import Foundation

enum Device: String, Identifiable {
    case iPhone, airPods
    
    var id: String {
        self.rawValue
    }
    
    var name: String {
        switch self {
        case .iPhone:
            R.string.localizable.iPhone()
        case .airPods:
            R.string.localizable.airPods()
        }
    }
}

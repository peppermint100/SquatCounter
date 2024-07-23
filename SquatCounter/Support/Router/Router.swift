//
//  Router.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/23/24.
//

import SwiftUI

protocol Router {
    var path: NavigationPath { get }
    func pop()
}

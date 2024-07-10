//
//  RSwift+Extension.swift
//  SquatCounter
//
//  Created by peppermint100 on 7/10/24.
//

import SwiftUI
import RswiftResources

extension RswiftResources.ImageResource {
    var image: Image {
        Image(name)
    }
}

extension RswiftResources.ColorResource {
    var color: Color {
        Color(name)
    }
}

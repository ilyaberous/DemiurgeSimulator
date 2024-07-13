//
//  Models.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 13.07.2024.
//

import Foundation
import UIKit

enum CellState {
    case alive
    case dead
    case life
}

struct VerticalGradient {
    let topColor: UIColor
    let bottomColor: UIColor
    
    init(topColor: UIColor, bottomColor: UIColor) {
        self.topColor = topColor
        self.bottomColor = bottomColor
    }
}

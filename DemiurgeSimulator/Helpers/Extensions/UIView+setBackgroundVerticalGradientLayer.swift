//
//  UIView+setVerticalBackgroundGradient.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 13.07.2024.
//

import Foundation
import UIKit


extension UIView {
   func setBackgroundVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

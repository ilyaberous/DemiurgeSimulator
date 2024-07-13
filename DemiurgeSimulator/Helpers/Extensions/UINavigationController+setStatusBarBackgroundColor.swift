//
//  UINavigationController+setStatusBarColor.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 12.07.2024.
//

import Foundation
import UIKit

extension UINavigationController {
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
}

//
//  UIColor+CustomColors.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 12.07.2024.
//

import Foundation
import UIKit

extension UIColor {
    class func DSPink() -> UIColor {
        return UIColor(red: 84/255.0, green: 53/255.0, blue: 110/255.0, alpha: 1.0)
    }
    
    class func DSPinkBttHighlighted() -> UIColor {
        return UIColor(red: 54/255.0, green: 34/255.0, blue: 71/255.0, alpha: 1.0)
    }
    
    class func DSBackgroundGradientTop() -> UIColor {
        return UIColor(red: 49/255.0, green: 0, blue: 80/255.0, alpha: 1.0)
    }
    
    class func DSBackgroundGradientBottom() -> UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    }
    
    class func DSDeadGradientTop() -> UIColor {
        return UIColor(red: 13/255.0, green: 101/255.0, blue: 138/255.0, alpha: 1.0)
    }
    
    class func DSDeadGradientBottom() -> UIColor {
        return UIColor(red: 176/255.0, green: 255/255.0, blue: 180/255.0, alpha: 1.0)
    }
    
    class func DSAliveGradientTop() -> UIColor {
        return UIColor(red: 255/255.0, green: 184/255.0, blue: 0, alpha: 1.0)
    }
    
    class func DSAliveGradientBottom() -> UIColor {
        return UIColor(red: 255/255.0, green: 247/255.0, blue: 176/255.0, alpha: 1.0)
    }
    
    class func DSLifeGradientTop() -> UIColor {
        return UIColor(red: 173/255.0, green: 0, blue: 255/255.0, alpha: 1.0)
    }
    
    class func DSLifeGradientBottom() -> UIColor {
        return UIColor(red: 255/255.0, green: 176/255.0, blue: 233/255.0, alpha: 1.0)
    }
}

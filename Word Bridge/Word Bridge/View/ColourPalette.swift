//
//  ColourPalette.swift
//  Word Bridge
//
//  Created by Jess Leivers on 08/10/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

struct ColourPalette {
    
    static func blue() -> UIColor {
        if game.isColourAccessibilityEnabled == false {
            return UIColor(red:0.10, green:0.31, blue:0.42, alpha:1.0)
        } else {
            return UIColor.black
        }
    }
    
    static func turquoise() -> UIColor {
        if game.isColourAccessibilityEnabled == false {
            return UIColor(red:0.02, green:0.52, blue:0.53, alpha:1.0)
        } else {
            return UIColor.white
        }
    }
    
    static func sage() ->  UIColor {
        if game.isColourAccessibilityEnabled == false {
            return UIColor(red:0.44, green:0.69, blue:0.50, alpha:1.0)
        } else {
            return UIColor.white
        }
    }
    
    static func orange() -> UIColor {
        if game.isColourAccessibilityEnabled == false {
            return UIColor(red:0.99, green:0.69, blue:0.24, alpha:1.0)
        } else {
            return UIColor.white
        }
    }
    
    static func brick() -> UIColor {
        if game.isColourAccessibilityEnabled == false {
            return UIColor(red:0.99, green:0.36, blue:0.25, alpha:1.0)
        } else {
            return UIColor.black
        }
    }
    
    static func hotPink() -> UIColor {
        if game.isColourAccessibilityEnabled == false {
            return UIColor(red:1.00, green:0.13, blue:0.27, alpha:1.0)
        } else {
            return UIColor.white
        }
    }
    
    static func black() -> UIColor {
        return UIColor.black
    }
    
    static func white() -> UIColor {
        return UIColor.white
    }
    
}

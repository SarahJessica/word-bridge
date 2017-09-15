//
//  ButtonMainMenu.swift
//  Word Bridge
//
//  Created by Jess Leivers on 14/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

class ButtonMainMenu: UIButton {
    
    @IBInspectable let bgColor: UIColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    @IBInspectable let cRad: CGFloat = 10
    @IBInspectable let borderWd: CGFloat = 1

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = bgColor
        self.layer.cornerRadius = cRad
        self.layer.borderWidth = borderWd
        self.layer.borderColor = bgColor.cgColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
}

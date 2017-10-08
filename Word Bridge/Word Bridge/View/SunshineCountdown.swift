//
//  SunshineCountdown.swift
//  Word Bridge
//
//  Created by Jess Leivers on 07/10/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

class SunshineCountdown: UILabel {

    
    @IBInspectable let bgColor: UIColor = ColourPalette.orange()
    @IBInspectable let cRad: CGFloat = 21
    @IBInspectable let txtColor: UIColor = ColourPalette.black()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        self.layer.backgroundColor = bgColor.cgColor
        self.layer.cornerRadius = cRad
        self.textColor = txtColor
        self.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

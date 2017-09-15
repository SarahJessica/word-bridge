//
//  LabelBridgeTile.swift
//  Word Bridge
//
//  Created by Jess Leivers on 15/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

class LabelBridgeTile: UILabel {

    @IBInspectable let bgColor: UIColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    @IBInspectable let txtColor: UIColor = .black
    @IBInspectable let cRad: CGFloat = 10
    
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

}

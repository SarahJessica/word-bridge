//
//  UIViewControllerExtensions.swift
//  Word Bridge
//
//  Created by Jess Leivers on 05/10/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

extension UIViewController {

        
    // displays prevAnswers in UI
    func updateVerticalSingleStringList(_ list: [String], in label: UILabel) {
        label.text! = ""
        for item in list {
            label.numberOfLines += 1
            label.text! += "\(item)\n"
        }
    }
    

}

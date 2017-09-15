//
//  GameViewController.swift
//  Word Bridge
//
//  Created by Jess Leivers on 14/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var quit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let gameData = GameData.getAllData() {
            print(gameData)
        }
    }

    @IBAction func dissmissGame(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
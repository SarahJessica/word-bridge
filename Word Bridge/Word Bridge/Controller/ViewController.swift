//
//  ViewController.swift
//  Word Bridge
//
//  Created by Jess Leivers on 14/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnStartGame: ButtonMainMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnStartGame.setTitle("Start Game", for: .normal)
        
        game.score = 0
        game.prevAnswers = []
        game.answerScores = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


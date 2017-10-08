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
    @IBOutlet weak var btnAboutWB: ButtonMainMenu!
    @IBOutlet weak var aboutView: UIView!
    
    @IBAction func btnAboutTapped(_ sender: Any) {
        aboutView.isHidden = false
    }
    
    @IBAction func btnCloseAboutTapped(_ sender: Any) {
        aboutView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnStartGame.setTitle("Start Game", for: .normal)
        btnAboutWB.setTitle("About Word Bridge", for: .normal)
        aboutView.isHidden = true

        game.score = 0
        game.prevAnswers = []
        game.answerScores = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


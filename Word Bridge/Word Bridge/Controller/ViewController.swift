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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var colourBg: UIView!
    @IBOutlet weak var accessibleColourSwitch: UISwitch!
    
    @IBAction func btnAboutTapped(_ sender: Any) {
        aboutView.isHidden = false
        descriptionLabel.text = """
        Word Bridge was originally created as a student project for COS7033-B at the University of Bradford.
        To play Word Bridge input words using the letters shown in the tiles along with other letters which 'bridge' these to make proper English words. Remember that the letters shown in the tiles must be used in order, left-to-right and cannot appear in a first for the first time before the letters in tiles have. It really isn't difficult, just have a go!
        """
    }
    
    @IBAction func btnCloseAboutTapped(_ sender: Any) {
        aboutView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnStartGame.setTitle("Start Game", for: .normal)
        btnAboutWB.setTitle("About Word Bridge", for: .normal)
        aboutView.isHidden = true
        colourBg.backgroundColor = ColourPalette.blue()
        isSwitchOnOrOff()
        
        game.score = 0
        game.prevAnswers = []
        game.answerScores = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isSwitchOnOrOff() {
        if game.isColourAccessibilityEnabled == true {
            accessibleColourSwitch.isOn = true
        } else {
            accessibleColourSwitch.isOn = false
        }
    }
    
    @IBAction func accessibleColourSwitched(_ sender: Any) {
        if game.isColourAccessibilityEnabled == true {
            game.isColourAccessibilityEnabled = false
            colourBg.backgroundColor = ColourPalette.blue()
        } else {
            game.isColourAccessibilityEnabled = true
            colourBg.backgroundColor = ColourPalette.blue()
        }
    }
}


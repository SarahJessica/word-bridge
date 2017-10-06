//
//  SuccessViewController.swift
//  Word Bridge
//
//  Created by Jess Leivers on 20/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var prevAnswersLabel: UILabel!
    @IBOutlet weak var prevScoresLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVerticalSingleStringDisplay(game.prevAnswers, in: prevAnswersLabel)
        updateVerticalSingleStringDisplay(game.answerScores, in: prevScoresLabel)
        totalScoreLabel.text = "Score: \(game.score)pts"
        _ = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc
    func timeToMoveOn() {
        self.performSegue(withIdentifier: "showStartScreen", sender: self)
    }

}

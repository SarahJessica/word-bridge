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
    @IBOutlet weak var tile1: LabelBridgeTile!
    @IBOutlet weak var tile2: LabelBridgeTile!
    @IBOutlet weak var tile3: LabelBridgeTile!
    @IBOutlet weak var textFieldAnswerBox: UITextField!
    @IBOutlet weak var countdown: UILabel!
    
    var countdownTime = 60
    var prevAnswers: [String] = []
    var set: GameData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let gameData = GameData.getAllData() {
            setUpGame(with: gameData)
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                self.countdownTime -= 1
                self.countdown.text = "\(self.countdownTime)"
                if self.countdownTime == 0 {
                    timer.invalidate()
                    self.endGame()
                }
            })
            timer.fire()
        }
        textFieldAnswerBox.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textFieldAnswerBox.autocorrectionType = .no
        textFieldAnswerBox.becomeFirstResponder()
    }

    @IBAction func dissmissGame(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpGame(with data: [GameData]) {
//        print("data.count \(data.count)")
        let random = Int(arc4random_uniform(UInt32(data.count)))
        set = data[random]
        if let set = set {
            tile1.text = set.tile1.uppercased()
            tile2.text = set.tile2.uppercased()
            tile3.text = set.tile3.uppercased()
        }
        
        countdown.textAlignment = .center
        countdown.layer.backgroundColor = #colorLiteral(red: 0.9956409335, green: 0.740465939, blue: 0.2969104052, alpha: 1).cgColor
        countdown.layer.cornerRadius = 21
        countdown.text = "\(countdownTime)"
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        if let set = set,
            ( set.validAnswers.contains(answer) && !prevAnswers.contains(answer)) {
            prevAnswers.append(answer)
            //TODO: call show accepted answer func here
            textFieldAnswerBox.text = ""
            return true
        }
        return false
    }
    //TODO: make func that shows answer just entred on screen
    
    func endGame() {
        print("game over")
        print("\(prevAnswers)")
    }
}

extension GameViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var validAnswer = false
        if let textFieldText = textField.text {
            // TODO: handle removal of whitespace within text view
            let input = newInput(string, in: textFieldText, at: range.location)
            validAnswer = checkAnswer(input)
        }
        return !validAnswer
    }
    
    func newInput(_ string: String, in stringText: String?, at rangeLocation: Int) -> String {
        let firstHalfString = (stringText as NSString?)?.substring(to: rangeLocation) ?? ""
        let secondHalfString = (stringText as NSString?)?.substring(from: rangeLocation) ?? ""
        return "\(firstHalfString)\(string)\(secondHalfString)"
    }
}

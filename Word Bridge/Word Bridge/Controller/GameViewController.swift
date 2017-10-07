//
//  GameViewController.swift
//  Word Bridge
//
//  Created by Jess Leivers on 14/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var tile1: LabelBridgeTile!
    @IBOutlet weak var tile2: LabelBridgeTile!
    @IBOutlet weak var tile3: LabelBridgeTile!
    @IBOutlet weak var textFieldAnswerBox: UITextField!
    @IBOutlet weak var countdown: UILabel!
    @IBOutlet weak var previousEntries: UILabel!
    @IBOutlet weak var bridgeImage: UIImageView!
    
    var countdownTime = 60
    
    var prevAnswers: [String] = []
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let gameData = GameData.getAllData() {
            setUpGame(with: gameData)
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
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

    
    func setUpGame(with data: [GameData]) {
        let random = Int(arc4random_uniform(UInt32(data.count)))
        game.set = data[random]
        if let s = game.set {
            tile1.text = s.tile1.uppercased()
            tile2.text = s.tile2.uppercased()
            tile3.text = s.tile3.uppercased()
        }
        
        countdown.textAlignment = .center
        countdown.layer.backgroundColor = #colorLiteral(red: 0.9956409335, green: 0.740465939, blue: 0.2969104052, alpha: 1).cgColor
        countdown.layer.cornerRadius = 21
        countdown.text = "\(countdownTime)"
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        if let set = game.set {
            let tilePlaceTuple = (
                findCharInString(char: Array(set.id)[0], string: answer),
                findCharInString(char: Array(set.id)[1], string: answer),
                findCharInString(char: Array(set.id)[2], string: answer)
            )
            showBridgeImage(for: tilePlaceTuple, in: answer)
            if ( set.validAnswers.contains(answer) && !game.prevAnswers.contains(answer)) {
            game.prevAnswers.insert(answer, at: 0)
            updateVerticalSingleStringDisplay(game.prevAnswers, in: previousEntries)
            textFieldAnswerBox.text = ""
            return true
            }
        }
        return false
    }
    
    func showBridgeImage(for tuple: (Int?, Int?, Int?), in string: String) {
        if string != "" {
            switch tuple {
            case (nil, nil, nil):
                print("no letters")
            case (_, nil, nil):
                print("first tile")
            case (_, _, nil):
                if tuple.0! > tuple.1! {
                    print("first tile")
                } else {
                    print("first two")
                }
            case (_,_,_):
                if tuple.0? < tuple.1? {
                    if tuple.1! < tuple.2! {
                        print("all three")
                    } else {
                        print("first two")
                    }
                } else {
                    print("no letters")
                }
            }
        } else {
               print("empty or 0")
        }
    }
    
    func findCharInString(char: Character, string: String) -> Int? {
        if let index = string.characters.index(of: char) {
            let pos = string.characters.distance(from: string.startIndex, to: index)
            print("Found \(char) at position \(pos)")
            return Int(pos)
        }
        else { return nil }
    }
    
    func calculateScore() {
        for answer in game.prevAnswers {
            var answerValue: Int
            let length = answer.characters.count
            let multiplier = length - 4
            if multiplier >= 2 {
                answerValue = length * multiplier
            } else {
                answerValue = length
            }
            game.answerScores.insert(answerValue, at: 0)
            game.score += answerValue
        }
    }
    
    func endGame() {
        calculateScore()
        self.performSegue(withIdentifier: "showSuccessView", sender: self)
    }
    
    @IBAction func dissmissGame(_ sender: Any) {
        timer.invalidate()
        self.dismiss(animated: true, completion: nil)
    }
}

extension GameViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var validAnswer = false
        if let textFieldText = textField.text {
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

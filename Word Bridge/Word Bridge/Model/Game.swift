//
//  Game.swift
//  Word Bridge
//
//  Created by Jess Leivers on 22/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import Foundation

struct Game {
    
    public var set: GameData?
    public var score: Int
    public var prevAnswers: [String]
    public var answerScores: [Int]
    public var isColourAccessibilityEnabled: Bool
    
}

var game = Game(set: nil, score: 0, prevAnswers: [], answerScores: [], isColourAccessibilityEnabled: true)

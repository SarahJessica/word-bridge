//
//  GameData.swift
//  Word Bridge
//
//  Created by Jess Leivers on 15/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import Foundation

struct GameData: Codable, CustomStringConvertible {
    
    let tile1: String
    let tile2: String
    let tile3: String
    let validAnswers: [String]
    
    static func getAllData() -> [GameData]? {
        let decoder = JSONDecoder()
        var allGameData: [GameData]?
        do {
            if let path = Bundle.main.path(forResource: "data", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                allGameData = try decoder.decode([GameData].self, from: data)
            }
        } catch {
            print("unable to access data")
            print("Error info: \(error)")
        }
        return allGameData
    }
    
    var description: String {
        return "tile1: \(tile1) \n tile2: \(tile2) \n tile3: \(tile3) \n acceptable answers: \(validAnswers)"
    }
    
}





//
//  Player.swift
//  TheWords
//
//  Created by Louise on 08/11/23.
//

import Foundation

struct Player {
    let name: String
    private(set) var score = 0
    
    mutating func add(score: Int) {
        self.score = score 
    }
}

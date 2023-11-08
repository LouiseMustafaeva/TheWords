//
//  GameViewModel.swift
//  TheWords
//
//  Created by Louise on 08/11/23.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var player1: Player
    @Published var player2: Player
    @Published var words = [String]()
    let word: String
    var isFirst = true
    
    init(player1: Player, player2: Player, word: String) {
        self.player1 = player1
        self.player2 = player2
        self.word = word.uppercased()
    }
    
    func validate(word: String) -> Bool {
        
        let word = word.uppercased()
        
        guard word != self.word else {
            print("This word was main")
            return false
        }
        
        guard !(words.contains(word)) else {
            print("This word was used")
            return false
        }
        
        guard word.count > 1 else {
            print("This word is short")
            return false
        }
        
        return true
    }
    
    func wordToChars(word: String) -> [Character] {
        
        var chars = [Character]()
        
        for char in word.uppercased() {
            chars.append(char)
        }
        
        return chars
    }
    
    func check(word: String) -> Int {
        
        guard self.validate(word: word) else { return 0 }
        
        var longWordArray = wordToChars(word: self.word)
        var shortWordArray = wordToChars(word: word)
        var result = ""
        
        for char in shortWordArray {
            if longWordArray.contains(char) {
                result.append(char)
                
                var i = 0
                while longWordArray[i] != char {
                    i += 1
                }
                longWordArray.remove(at: i)
            } else {
                return 0
            }
        }
        
        guard result == word.uppercased() else { return 0 }
        
        words.append(result)
        
        if isFirst {
            player1.add(score: result.count)
        } else {
            player2.add(score: result.count)
        }
        
        isFirst.toggle()
        
        return result.count 
    }
}

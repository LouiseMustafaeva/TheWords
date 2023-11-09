//
//  GameViewModel.swift
//  TheWords
//
//  Created by Louise on 08/11/23.
//

import Foundation

enum WordError: Error {
    case theSameWord
    case beforeWord
    case shortWord
    case wrongWord
    case undefinedError
}

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
    
    func validate(word: String) throws {
        
        let word = word.uppercased()
        
        guard word != self.word else {
            print("This word was main!")
            throw WordError.theSameWord
        }
        
        guard !(words.contains(word)) else {
            print("This word was used!")
            throw WordError.beforeWord
        }
        
        guard word.count > 1 else {
            print("This word is short!")
            throw WordError.shortWord
        }
        
        return
    }
    
    func wordToChars(word: String) -> [Character] {
        
        var chars = [Character]()
        
        for char in word.uppercased() {
            chars.append(char)
        }
        
        return chars
    }
    
    func check(word: String) throws -> Int {
        
        do {
            try self.validate(word: word)
        } catch {
            throw error
        }
        
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
                throw WordError.wrongWord
            }
        }
        
        guard result == word.uppercased() else {
            print("This word was main!")
            throw WordError.wrongWord 
        }
        
        words.append(result)
        
        if isFirst {
            player1.score += result.count
        } else {
            player2.score += result.count
        }
        
        isFirst.toggle()
        
        return result.count 
    }
}

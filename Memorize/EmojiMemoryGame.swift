//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bruno Henrique de Borba on 13/02/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🇧🇷","😎","🍊","👉","👍"]
        
        // Generate random number of pairs, between 2 and 5
        let numberOfPairsOfCards = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

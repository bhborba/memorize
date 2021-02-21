//
//  MemoryGame.swift
//  Memorize
//  Model code
//  Created by Bruno Henrique de Borba on 13/02/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card)  {
        print("card chosen: \(card)")
        let choosenIndex: Int = cards.firstIndex(matching: card)
        cards[choosenIndex].isFaceUp = !cards[choosenIndex].isFaceUp
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content =  cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        // Shuffle the cards
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Bruno Henrique de Borba on 13/02/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame 
    
    var body: some View {
         HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.green)
            .font(viewModel.cards.count == 10 ? Font.headline : Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

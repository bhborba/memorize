//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Bruno Henrique de Borba on 13/02/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel: EmojiMemoryGame 
    
    var body: some View {
        Grid (viewModel.cards) { card in
            CardView(card: card).onTapGesture{
                viewModel.choose(card: card)
            }
            .padding(5)
        }
            .padding()
            .foregroundColor(Color.green)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            if card.isFaceUp || !card.isMatched{
                ZStack {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true).padding(5).opacity(0.4)
                    Text(card.content) .font(Font.system(size: fontSize(for: geometry.size)))
                }
                .cardify(isFaceUp: card.isFaceUp)
            }
        }
    }
    
    // MARK: - Drawing Constants
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}

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
         HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.green)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
            .aspectRatio(aspectRatioValue, contentMode: .fit)
        }
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let aspectRatioValue: CGFloat = 2/3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

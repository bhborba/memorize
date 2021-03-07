//
//  Cardify.swift
//  Memorize
//
//  Created by Bruno Henrique de Borba on 07/03/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack{
            if  isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let aspectRatioValue: CGFloat = 2/3
}

extension View {
    func cardify(isFaceUp: Bool) ->  some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

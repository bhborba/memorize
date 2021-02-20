//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Bruno Henrique de Borba on 13/02/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

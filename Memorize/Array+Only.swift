//
//  Array+Only.swift
//  Memorize
//
//  Created by Bruno Henrique de Borba on 21/02/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

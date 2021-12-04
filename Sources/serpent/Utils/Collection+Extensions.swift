//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (exists index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Array where Element == Entity {
    var players: [Entity] {
        return CHARACTERS.count == Character.playerCount ? CHARACTERS : CHARACTERS.dropLast()
    }
}

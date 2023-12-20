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
        if let npc = NPC {
            return CHARACTERS + [npc]
        }
        return CHARACTERS
    }
}

extension Array where Element == Ability {
    func find(_ name: String) -> Element? {
        return first { $0.name == name }
    }
}

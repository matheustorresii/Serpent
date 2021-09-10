//
//  Actions.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation
import Sword

enum Actions: String {
    case id
    
    case ability
    case append
    case attack
    case boss
    case check
    case damage
    case enemies
    case exattack = "extension"
    case heal
    case random
    case reset
    case rest
    
    var execute: ((Message) -> Void) {
        switch self {
            case .id:       return { $0.id() }
                
            case .ability:  return { $0.ability() }
            case .append:   return { $0.append() }
            case .attack:   return { $0.attack() }
            case .boss:     return { $0.boss() }
            case .check:    return { $0.check() }
            case .damage:   return { $0.damage() }
            case .enemies:  return { $0.enemies() }
            case .exattack: return { $0.exattack() }
            case .heal:     return { $0.heal() }
            case .random:   return { $0.random() }
            case .reset:    return { $0.reset() }
            case .rest:     return { $0.rest() }
        }
    }
}

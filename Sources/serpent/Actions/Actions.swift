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
    case test
    
    case ability
    case append
    case appendItem
    case atk
    case attack
    case boss
    case bossSummon
    case check
    case damage
    case def
    case disable
    case enemies
    case exattack = "extension"
    case heal
    case item
    case money
    case protect
    case random
    case reset
    case rest
    case removeItem
    case setBoss
    case summon
    case unrest
    
    var execute: ((Message) -> Void) {
        switch self {
        case .id:       return { $0.id() }
        case .test:       return { $0.test() }
            
        case .ability:    return { $0.ability() }
        case .append:     return { $0.append() }
        case .appendItem: return { $0.appendItem() }
        case .atk:        return { $0.atk() }
        case .attack:     return { $0.attack(isExtension: false) }
        case .boss:       return { $0.boss() }
        case .bossSummon: return { $0.bossSummon() }
        case .check:      return { $0.check() }
        case .damage:     return { $0.damage() }
        case .def:        return { $0.def() }
        case .disable:    return { $0.disable() }
        case .enemies:    return { $0.enemies() }
        case .exattack:   return { $0.attack(isExtension: true) }
        case .heal:       return { $0.heal() }
        case .item:       return { $0.item() }
        case .money:      return { $0.money() }
        case .protect:    return { $0.protect() }
        case .random:     return { $0.random() }
        case .reset:      return { $0.reset() }
        case .rest:       return { $0.rest() }
        case .removeItem: return { $0.removeItem() }
        case .setBoss:    return { $0.setBoss() }
        case .summon:     return { $0.summon() }
        case .unrest:     return { $0.unrest() }
        }
    }
}

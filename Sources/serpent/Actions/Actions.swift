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
    case buff
    case check
    case damage
    case def
    case enemies
    case exattack = "extension"
    case heal
    case item
    case money
    case nerf
    case npc
    case party
    case players
    case purify
    case random
    case reset
    case rest
    case removeItem
    case setBoss
    case summon
    case ult
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
        case .buff:       return { $0.buff() }
        case .check:      return { $0.check() }
        case .damage:     return { $0.damage() }
        case .def:        return { $0.def() }
        case .enemies:    return { $0.enemies() }
        case .exattack:   return { $0.attack(isExtension: true) }
        case .heal:       return { $0.heal() }
        case .item:       return { $0.item() }
        case .money:      return { $0.money() }
        case .nerf:       return { $0.nerf() }
        case .npc:        return { $0.npc() }
        case .party:      return { $0.party() }
        case .players:    return { $0.players() }
        case .purify:     return { $0.purify() }
        case .random:     return { $0.random() }
        case .reset:      return { $0.reset() }
        case .rest:       return { $0.rest() }
        case .removeItem: return { $0.removeItem() }
        case .setBoss:    return { $0.setBoss() }
        case .summon:     return { $0.summon() }
        case .ult:        return { $0.ult() }
        case .unrest:     return { $0.unrest() }
        }
    }
}

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
    case atk
    case attack
    case boss
    case check
    case damage
    case def
    case disable
    case enemies
    case exattack = "extension"
    case heal
    case protect
    case random
    case reset
    case rest
    
    var execute: ((Message) -> Void) {
        switch self {
        case .id:       return { $0.id() }
            
        case .ability:  return { $0.ability() }
        case .append:   return { $0.append() }
        case .atk:      return { $0.atk() }
        case .attack:   return { $0.attack(isExtension: false) }
        case .boss:     return { $0.boss() }
        case .check:    return { $0.check() }
        case .damage:   return { $0.damage() }
        case .def:      return { $0.def() }
        case .disable:  return { $0.disable() }
        case .enemies:  return { $0.enemies() }
        case .exattack: return { $0.attack(isExtension: true) }
        case .protect:  return { $0.protect() }
        case .heal:     return { $0.heal() }
        case .random:   return { $0.random() }
        case .reset:    return { $0.reset() }
        case .rest:     return { $0.rest() }
        }
    }
}

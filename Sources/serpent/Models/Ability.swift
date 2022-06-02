//
//  Ability.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

struct Ability {
    let name: String
    let power: Int
    var pp: Int
    let attributes: [Attributes]
    
    mutating func pp(_ value: Int) {
        pp = value
    }
}

enum Attributes {
    // STATUS
    case speed
    case protect
    case counter
    case purify
    
    // BUFFS & NERFS
    case buffAtk
    case buffDef
    case nerfAtk
    case nerfDef
    
    case doubleBuffAtk
    case doubleBuffDef
    case doubleNerfAtk
    case doubleNerfDef
    
    case tripleBuffAtk
    case tripleBuffDef
    case tripleNerfAtk
    case tripleNerfDef
    
    // DAMAGES
    case physical
    case combo
    case critical
    
    // HEALING
    case heal
    case revive
    case drain
    case endeavor
    
    // BOSS
    case area
    case disable
    case paralyze
    
    // SPECIAL
    case suicide
    
    var shouldDoDamage: Bool {
        switch self {
        case .speed,
                .buffAtk,
                .buffDef,
                .nerfAtk,
                .nerfDef,
                .protect,
                .counter,
                .heal,
                .revive,
                .endeavor,
                .doubleBuffAtk,
                .doubleBuffDef,
                .doubleNerfAtk,
                .doubleNerfDef,
                .tripleBuffAtk,
                .tripleBuffDef,
                .tripleNerfAtk,
                .tripleNerfDef,
                .suicide:
            return false
        case .physical,
                .combo,
                .critical,
                .drain,
                .area,
                .disable,
                .purify,
                .paralyze:
            return true
        }
    }
}

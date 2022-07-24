//
//  File.swift
//  
//
//  Created by Matheus Torres on 24/07/22.
//

import Foundation

protocol AbilityBase {
    var name: String { get }
    var power: Int { get }
    var attributes: [Attributes] { get }
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
                .disable,
                .purify,
                .paralyze,
                .suicide:
            return false
        case .physical,
                .combo,
                .critical,
                .drain,
                .area:
            return true
        }
    }
}

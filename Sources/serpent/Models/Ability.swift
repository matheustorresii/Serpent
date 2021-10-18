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
    case buffAtk
    case buffDef
    case nerfAtk
    case nerfDef
    case protect
    
    // DAMAGES
    case physical
    case combo
    case critical
    case heal
    case drain
    case narrative
    
    // BOSS
    case area
    case disable
    
    var shouldDoDamage: Bool {
        switch self {
        case .buffAtk, .buffDef, .nerfAtk, .nerfDef, .protect, .heal:
            return false
        case .physical, .combo, .critical, .drain, .narrative, .area, .disable:
            return true
        }
    }
}

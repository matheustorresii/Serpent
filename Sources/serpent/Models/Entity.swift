//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

enum Status {
    case doubleNerfed
    case nerfed
    case normal
    case buffed
    case doubleBuffed
    
    enum Direction {
        case reduce
        case improve
    }
    
    var next: Status {
        switch self {
        case .doubleNerfed: return .nerfed
        case .nerfed:       return .normal
        case .normal:       return .buffed
        case .buffed:       return .doubleBuffed
        case .doubleBuffed: return .doubleBuffed
        }
    }
    
    var previous: Status {
        switch self {
        case .doubleNerfed: return .doubleNerfed
        case .nerfed:       return .doubleNerfed
        case .normal:       return .nerfed
        case .buffed:       return .normal
        case .doubleBuffed: return .buffed
        }
    }
}

struct Entity {
    let name: String
    var currentHp: Int
    
    let hp: Int
    let atk: Int
    let exa: Int
    let def: Int
    let spd: Int
    
    var abilities: [Ability]
    
    var atkBuffed: Bool
    var defBuffed: Bool
    var atkNerfed: Bool
    var defNerfed: Bool
    
    var atkStatus: Status
    var defStatus: Status
    var protected: Bool
    var disabled: Bool
    
    init(name: String,
         hp: Int,
         atk: Int,
         exa: Int,
         def: Int,
         spd: Int,
         abilities: [Ability]) {
        
        self.name = name
        self.currentHp = hp
        
        self.hp = hp
        self.atk = atk
        self.exa = exa
        self.def = def
        self.spd = spd
        
        self.abilities = abilities
        
        self.atkBuffed = false
        self.defBuffed = false
        self.atkNerfed = false
        self.defNerfed = false
        
        self.atkStatus = .normal
        self.defStatus = .normal
        self.protected = false
        self.disabled = false
    }
    
    mutating func currentHp(_ value: Int) {
        currentHp = value
    }
    
    mutating func atkBuffed(_ state: Bool) {
        atkBuffed = state
    }
    
    mutating func defBuffed(_ state: Bool) {
        defBuffed = state
    }
    
    mutating func atkNerfed(_ state: Bool) {
        atkNerfed = state
    }
    
    mutating func defNerfed(_ state: Bool) {
        defNerfed = state
    }
    
    mutating func atkStatus(_ direction: Status.Direction) {
        atkStatus = direction == .improve ? atkStatus.next : atkStatus.previous
    }
    
    mutating func defStatus(_ direction: Status.Direction) {
        defStatus = direction == .improve ? defStatus.next : defStatus.previous
    }
    
    mutating func protected(_ state: Bool) {
        protected = state
    }
    
    mutating func disabled(_ state: Bool) {
        disabled = state
    }
}

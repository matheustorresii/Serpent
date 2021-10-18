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
    
    var multiplier: Double {
        switch self {
        case .doubleNerfed: return 0.50
        case .nerfed: return 0.75
        case .normal: return 1.00
        case .buffed: return 1.25
        case .doubleBuffed: return 1.50
        }
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
    
    var description: (String, Direction)? {
        switch self {
        case .doubleNerfed: return ("muito abaixo do normal", .reduce)
        case .nerfed:       return ("abaixo do normal", .reduce)
        case .normal:       return nil
        case .buffed:       return ("acima do normal", .improve)
        case .doubleBuffed: return ("muito acima do normal", .improve)
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
        
        self.atkStatus = .normal
        self.defStatus = .normal
        self.protected = false
        self.disabled = false
    }
    
    mutating func reset() {
        atkStatus = .normal
        defStatus = .normal
        protected = false
        disabled = false
    }
    
    mutating func currentHp(_ value: Int) {
        currentHp = value
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

//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

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
    var protected: Bool
    
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
        self.protected = false
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
    
    mutating func protected(_ state: Bool) {
        protected = state
    }
}

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
    
    let summon: Summon?
    
    var money: Int
    var items: [Item]
    var abilities: [Ability]
    
    var atkStatus: Status
    var defStatus: Status
    
    var protection: Protection

    var disabled: Bool
    
    init(name: String,
         hp: Int,
         atk: Int,
         exa: Int,
         def: Int,
         spd: Int,
         summon: Summon? = nil,
         money: Int = 0,
         item: [Item] = [],
         abilities: [Ability] = []) {
        
        self.name = name
        self.currentHp = hp
        
        self.hp = hp
        self.atk = atk
        self.exa = exa
        self.def = def
        self.spd = spd
        
        self.summon = summon
        
        self.money = money
        self.items = item
        self.abilities = abilities
        
        self.atkStatus = .normal
        self.defStatus = .normal
        self.protection = .none
        self.disabled = false
    }
    
    mutating func reset() {
        atkStatus = .normal
        defStatus = .normal
        protection = .none
        disabled = false
    }
    
    mutating func addHp(_ value: Int) {
        currentHp += value
    }
    
    mutating func subHp(_ value: Int) {
        currentHp -= value
    }
    
    mutating func currentHp(_ value: Int) {
        currentHp = value
    }
    
    mutating func money(_ value: Int) {
        money += value
    }
    
    mutating func atkStatus(_ direction: Status.Direction) {
        atkStatus = direction == .improve ? atkStatus.next : atkStatus.previous
    }
    
    mutating func defStatus(_ direction: Status.Direction) {
        defStatus = direction == .improve ? defStatus.next : defStatus.previous
    }
    
    mutating func protection(_ state: Protection) {
        protection = state
    }
    
    mutating func disabled(_ state: Bool) {
        disabled = state
    }
}

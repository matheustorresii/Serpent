//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

struct Entity {
    
    // MARK: - PROPERTIES
    
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
    
    var buff: Buff
    var nerf: Nerf
    
    var charge: Int
    
    // MARK: - INITIALIZERS
    
    init(name: String,
         hp: Int,
         atk: Int,
         exa: Int,
         def: Int,
         spd: Int,
         summon: Summon? = nil,
         money: Int = .zero,
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
        
        self.buff = .none
        self.nerf = .none
        
        self.charge = .zero
    }
    
    // MARK: - METHODS
    
    mutating func reset() {
        atkStatus = .normal
        defStatus = .normal
        buff = .none
        nerf = .none
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
    
    mutating func buff(_ state: Buff) {
        buff = state
    }
    
    mutating func nerf(_ state: Nerf) {
        nerf = state
    }
    
    mutating func stopBuffIfNeeded() {
        if buff.shouldStop {
            buff = .none
        }
    }
    
    mutating func stopNerfIfNeeded() {
        if nerf.shouldStop {
            nerf = .none
        }
    }
}

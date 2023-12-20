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
    var ultimate: Ultimate?
    
    var money: Int
    var items: [Item]
    var abilities: [Ability]
    
    var atkStatus: Status
    var defStatus: Status
    
    var buff: Buff
    var nerf: Nerf
    
    // MARK: - INITIALIZERS
    
    init(name: String,
         hp: Int,
         atk: Int,
         exa: Int,
         def: Int,
         spd: Int,
         summon: Summon? = nil,
         ultimate: Ultimate? = nil,
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
        self.ultimate = ultimate
        
        self.money = money
        self.items = item
        self.abilities = abilities
        
        self.atkStatus = .normal
        self.defStatus = .normal
        
        self.buff = .none
        self.nerf = .none
    }
    
    static var empty: Entity {
        return .init(name: "null",
                     hp: .zero,
                     atk: .zero,
                     exa: .zero,
                     def: .zero,
                     spd: .zero)
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

// MARK: - EXTENSIONS

// Testers:
// 417119513788809218 = Maryana
// 240600043013406720 = Heitor
// Masters:
// 316249647137947648 = BlinkN
// 748944007366705223 = DevDev
// Players 1:
// 337595162572095510 = Pedrin
// 892539055953305630 = Pedrin 2
// 419197752816173057 = Thiaguin
// 204663989395783680 = Samuel
// 243371249215078400 = Savio
// Players 2:
// 416753972704182273 = Elias
// 949316601537245254 = Giovanna
// 696057802552115200 = Giulia
// 243371249215078400 = Savio
// 258682486219866124 = Xande

extension Entity {
    static func getEntityWith(id: String?) -> Entity {
        switch id {
        case "949316601537245254":
            return ADELINE
        case "243371249215078400":
            return ALKI
        case "696057802552115200":
            return AMREN
        case "416753972704182273":
            return VALAK
        case "258682486219866124":
            return YONIN
        default:
            return NPC ?? .empty
        }
    }
    
    static func getEntityWith(name: String) -> Entity {
        return CHARACTERS.players.first { $0.name.lowercased() == name.lowercased() } ?? NPC ?? .empty
    }
}

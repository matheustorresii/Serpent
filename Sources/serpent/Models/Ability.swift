//
//  Ability.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

protocol TechniqueProtocol: AnyObject {
    var name: String { get set }
    var power: Int { get set }
    var attributes: [Attributes] { get set }
}

extension TechniqueProtocol {
    func asAbility() -> AbilityProtocol? {
        self as? AbilityProtocol
    }
    
    func asUltimate() -> UltimateProtocol? {
        self as? UltimateProtocol
    }
}

// MARK: - ABILITY

protocol AbilityProtocol: TechniqueProtocol {
    var pp: Int { get set }
}

class Ability: AbilityProtocol {
    var name: String
    var power: Int
    var attributes: [Attributes]
    var pp: Int
    
    init(name: String,
         power: Int,
         pp: Int,
         attributes: [Attributes]) {
        self.name = name
        self.power = power
        self.attributes = attributes
        self.pp = pp
    }
}

// MARK: - ULTIMATE

protocol UltimateProtocol: TechniqueProtocol {
    var charge: Int { get set }
    var limit: Int { get set }
    func addCharge(_ value: Int)
}

class Ultimate: UltimateProtocol {
    var name: String
    var power: Int
    var attributes: [Attributes]
    
    var charge: Int
    var limit: Int
    
    init(name: String,
         power: Int,
         attributes: [Attributes],
         charge: Int,
         limit: Int = 1000) {
        self.name = name
        self.power = power
        self.attributes = attributes
        self.charge = charge
        self.limit = limit
    }
    
    func addCharge(_ value: Int) {
        self.charge = min(value + self.charge, limit)
    }
}

// MARK: - COMBO

protocol ComboProtocol: TechniqueProtocol {
    var players: [Character] { get set }
}

class Combo: ComboProtocol {
    var name: String
    var power: Int
    var attributes: [Attributes]
    var players: [Character]
    
    init(name: String,
         power: Int,
         attributes: [Attributes],
         players: [Character]) {
        self.name = name
        self.power = power
        self.attributes = attributes
        self.players = players
    }
}

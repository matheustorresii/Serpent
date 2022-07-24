//
//  File.swift
//  
//
//  Created by Matheus Torres on 23/03/22.
//

import Foundation

var NPC: Entity?

enum Npcs: String {
    case null
    case test
    case yareth
    case peter
    case aurora
    case korin
    
    var entity: Entity? {
        switch self {
        case .null:   return nil
        case .test:   return TEST
        case .yareth: return YARETH
        case .peter:  return PETER
        case .aurora: return AURORA
        case .korin:  return KORIN
        }
    }
}

fileprivate let TEST = Entity(name: "Teste",
                              hp: 100,
                              atk: 100,
                              exa: 100,
                              def: 100,
                              spd: 100,
                              summon: nil,
                              money: 100,
                              item: [],
                              abilities: [
                                .init(name: "Endeavor",
                                      power: 0,
                                      pp: 100,
                                      attributes: [.endeavor]),
                                .init(name: "Purify",
                                      power: 0,
                                      pp: 100,
                                      attributes: [.purify])
                              ])

fileprivate let YARETH = Entity(name: "Yareth",
                                hp: 1000,
                                atk: 36,
                                exa: 36,
                                def: 30,
                                spd: 23,
                                summon: .QUETZALCOATL,
                                abilities: [
                                    .init(name: "Benção da Serpente",
                                          power: 1,
                                          pp: 10,
                                          attributes: [.heal])
                                ])

fileprivate let PETER = Entity(name: "Peter",
                               hp: 100,
                               atk: 80,
                               exa: 5,
                               def: 95,
                               spd: 70,
                               abilities: [
                                .init(name: "Vai teia",
                                      power: 0,
                                      pp: 10,
                                      attributes: [.nerfDef, .nerfAtk])
                               ])

fileprivate let AURORA = Entity(name: "Aurora",
                                hp: 200,
                                atk: 120,
                                exa: 5,
                                def: 80,
                                spd: 45,
                                summon: .FENRIR,
                                abilities: [
                                    .init(name: "Espadas da Irmandade",
                                          power: 2,
                                          pp: 5,
                                          attributes: [.critical, .combo, .physical]),
                                    .init(name: "Armadura Gélida",
                                          power: 0,
                                          pp: 10,
                                          attributes: [.doubleBuffDef]),
                                    .init(name: "Iluminação",
                                          power: 0,
                                          pp: 10,
                                          attributes: [.heal, .buffAtk])
                                ])

fileprivate let KORIN = Entity(name: "Korin",
                               hp: 200,
                               atk: 120,
                               exa: 200,
                               def: 130,
                               spd: 10,
                               summon: .IMPUNDULU,
                               abilities: [
                                .init(name: "𝔼𝕃𝔼ℂ𝕋ℝ𝕀𝔽𝕐",
                                      power: 0,
                                      pp: 5,
                                      attributes: [.paralyze]),
                                .init(name: "𝔾ℝ𝔸ℕ𝔻 𝕋ℍ𝕌ℕ𝔻𝔼ℝ",
                                      power: 10,
                                      pp: 3,
                                      attributes: [.critical])
                               ])

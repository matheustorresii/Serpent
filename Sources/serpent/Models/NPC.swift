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
    
    var entity: Entity? {
        switch self {
        case .null:   return nil
        case .test:   return TEST
        case .yareth: return YARETH
        case .peter:  return PETER
        case .aurora: return AURORA
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
                                atk: 1,
                                exa: 1,
                                def: 1000,
                                spd: 1,
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
                                atk: 105,
                                exa: 5,
                                def: 70,
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
                                          attributes: [.doubleBuffAtk])
                                ])

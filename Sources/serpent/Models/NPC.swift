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
    case maha
    case ayie
    case anya
    
    var entity: Entity? {
        switch self {
        case .null:   return nil
        case .test:   return TEST
        case .yareth: return YARETH
        case .peter:  return PETER
        case .aurora: return AURORA
        case .korin:  return KORIN
        case .maha:   return MAHA
        case .ayie:   return AYIE
        case .anya:   return ANYA
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
                                          pp: 3,
                                          attributes: [.purify, .heal]),
                                    .init(name: "Corte aéreo",
                                          power: 3,
                                          pp: 5,
                                          attributes: [.critical, .combo]),
                                    .init(name: "Deus do Vento",
                                          power: 0,
                                          pp: 5,
                                          attributes: [.doubleBuffAtk, .doubleBuffDef])
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
                               ultimate: .GRAND_THUNDER,
                               abilities: [
                                .init(name: "𝔼𝕃𝔼ℂ𝕋ℝ𝕀𝔽𝕐",
                                      power: 0,
                                      pp: 5,
                                      attributes: [.paralyze])
                               ])

fileprivate let ANYA: Entity = .init(name: "Anya",
                         hp: 110,
                         atk: 70,
                         exa: 40,
                         def: 65,
                         spd: 40,
                         summon: .NEMESIS,
                         money: 3915,
                         item: [
                            .init(name: "Chicken Chess", effect: .buffDef, size: .large),
                            .init(name: "Licor de Frango", effect: .purify, size: .small)
                         ],
                         abilities: [
                            .init(name: "CEGUEIRA",
                                  power: 0,
                                  pp: 5,
                                  attributes: [.doubleBuffAtk]),
                            .init(name: "IGUALDADE",
                                  power: 0,
                                  pp: 5,
                                  attributes: [.endeavor]),
                            .init(name: "JUSTIÇA DIVINA",
                                  power: 1,
                                  pp: 5,
                                  attributes: [.combo]),
                            .init(name: "HUMILDADE",
                                  power: 0,
                                  pp: 10,
                                  attributes: [.nerfAtk]),
                         ])

fileprivate let AYIE: Entity = .init(name: "Ayie",
                         hp: 96,
                         atk: 43,
                         exa: 93,
                         def: 62,
                         spd: 31,
                         summon: .EMERE,
                         money: 4160,
                         item: [
                            .init(name: "Balde de Frango", effect: .heal, size: .medium),
                            .init(name: "Balde de Frango", effect: .heal, size: .medium),
                            .init(name: "Coração de Galinha", effect: .revive, size: .medium)
                         ],
                         abilities: [
                            .init(name: "Interdimensional",
                                  power: 2,
                                  pp: 10,
                                  attributes: [.combo]),
                            .init(name: "Neclo",
                                  power: 0,
                                  pp: 3,
                                  attributes: [.tripleBuffAtk, .tripleNerfDef]),
                            .init(name: "Roubar Vida",
                                  power: 1,
                                  pp: 10,
                                  attributes: [.drain]),
                            .init(name: "Cale-se para sempre",
                                  power: 0,
                                  pp: 10,
                                  attributes: [.counter])
                         ])

fileprivate let MAHA: Entity = .init(name: "Maha",
                         hp: 110,
                         atk: 120,
                         exa: 5,
                         def: 80,
                         spd: 10,
                         summon: .ZHU_QUE,
                         money: 4530,
                         item: [
                            .init(name: "Pena de Grifo", effect: .revive, size: .large),
                            .init(name: "Balde de Frango", effect: .heal, size: .medium),
                            .init(name: "Coroa do Pesadelo", effect: .buffDef, size: .large)
                         ],
                         abilities: [
                            .init(name: "Arte família",
                                  power: 0,
                                  pp: 10,
                                  attributes: [.critical, .physical]),
                            .init(name: "Fogo corrosivo",
                                  power: 0,
                                  pp: 5,
                                  attributes: [.doubleNerfAtk]),
                            .init(name: "Concentração de Zhū Què",
                                  power: 0,
                                  pp: 10,
                                  attributes: [.buffAtk]),
                            .init(name: "Respiração pai",
                                  power: 5,
                                  pp: 3,
                                  attributes: [.physical, .critical])
                         ])

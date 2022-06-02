//
//  File.swift
//  
//
//  Created by Matheus Torres on 29/09/21.
//

import Foundation

var BOSS: Entity?

enum Bosses: String {
    case null
    case okot
    case lohan
    case oleg
    case froycon
    case ikelos
    case yeti
    case anubis
    case gryphon
    case urcaguary
    case nock
    case ratman
    
    var entity: Entity? {
        switch self {
        case .null:      return nil
        case .okot:      return OKOT
        case .lohan:     return LOHAN
        case .oleg:      return OLEG
        case .froycon:   return FROYCON
        case .ikelos:    return IKELOS
        case .yeti:      return YETI
        case .anubis:    return ANUBIS
        case .gryphon:   return GRYPHON
        case .urcaguary: return URCAGUARY
        case .nock:      return NOCK
        case .ratman:    return RATMAN
        }
    }
}

fileprivate let OKOT = Entity(name: "Okot (Drayden)",
                              hp: 550,
                              atk: 20,
                              exa: 25,
                              def: 100,
                              spd: 18,
                              abilities: [
                                .init(name: "Drenagem", power: 0, pp: 5, attributes: [.drain]),
                                .init(name: "Chuva de pólen", power: 0, pp: 5, attributes: [.nerfAtk, .nerfDef]),
                                .init(name: "Petrificar", power: 1, pp: 5, attributes: [.disable])
                              ])

fileprivate let LOHAN = Entity(name: "Lohan",
                               hp: 400,
                               atk: 30,
                               exa: 60,
                               def: 60,
                               spd: 60,
                               abilities: [
                                .init(name: "Paralisar", power: 0, pp: 5, attributes: [.disable, .nerfAtk]),
                                .init(name: "Choque do trovão", power: 1, pp: 5, attributes: [.critical]),
                                .init(name: "Mjölnir", power: 5, pp: 1, attributes: [.combo])
                               ])

fileprivate let OLEG: Entity = .init(name: "Oleg",
                                     hp: 45,
                                     atk: 0,
                                     exa: 45,
                                     def: 35,
                                     spd: 90,
                                     summon: .ULLR,
                                     money: 265,
                                     item: [],
                                     abilities: [
                                        .init(name: "Ira de Ullr",
                                              power: 0,
                                              pp: 10,
                                              attributes: [.buffAtk]),
                                        .init(name: "Curaflecha",
                                              power: 2,
                                              pp: 10,
                                              attributes: [.heal]),
                                        .init(name: "Flechão",
                                              power: 200,
                                              pp: 1,
                                              attributes: [.critical, .suicide]),
                                     ])

fileprivate let FROYCON: Entity = .init(name: "Froycon",
                                        hp: 30,
                                        atk: 36,
                                        exa: 36,
                                        def: 30,
                                        spd: 23,
                                        summon: .IKELOS,
                                        money: 100,
                                        item: [],
                                        abilities: [
                                            .init(name: "Aura Negra",
                                                  power: 0,
                                                  pp: 3,
                                                  attributes: [.protect]),
                                            .init(name: "Confusão Mental",
                                                  power: 0,
                                                  pp: 5,
                                                  attributes: [.critical]),
                                            .init(name: "Deus do Pesadelo",
                                                  power: 0,
                                                  pp: 1,
                                                  attributes: [.buffAtk, .buffDef]),
                                        ])

fileprivate let IKELOS: Entity = .init(name: "Froycon (Deus do Pesadelo)",
                                       hp: 100,
                                       atk: 46,
                                       exa: 46,
                                       def: 40,
                                       spd: 32,
                                       abilities: [
                                        .init(name: "Névoa negra",
                                              power: 1,
                                              pp: 3,
                                              attributes: [.area]),
                                        .init(name: "Paralisia do Sono",
                                              power: 0,
                                              pp: 5,
                                              attributes: [.nerfAtk]),
                                        .init(name: "Deus do Pesadelo Desperto",
                                              power: 0,
                                              pp: 1,
                                              attributes: [.doubleBuffAtk, .doubleBuffDef]),
                                       ])

fileprivate let YETI: Entity = .init(name: "Yeti",
                                     hp: 120,
                                     atk: 40,
                                     exa: 40,
                                     def: 70,
                                     spd: 15,
                                     abilities: [
                                        .init(name: "Nevasca",
                                              power: 1,
                                              pp: 3,
                                              attributes: [.area]),
                                        .init(name: "Fica frio ai",
                                              power: 0,
                                              pp: 3,
                                              attributes: [.disable])
                                     ])

fileprivate let ANUBIS = Entity(name: "Anúbis",
                                hp: 500,
                                atk: 40,
                                exa: 50,
                                def: 80,
                                spd: 50,
                                money: 100,
                                item: [
                                    .init(name: "Poção de Ataque",
                                          effect: .buffAtk,
                                          size: .small),
                                    .init(name: "Poção de Defesa",
                                          effect: .buffDef,
                                          size: .small)
                                ],
                                abilities: [
                                    .init(name: "Esfera Sombria", power: 1, pp: 10, attributes: []),
                                    .init(name: "Onda da Morte", power: 1, pp: 5, attributes: [.area]),
                                    .init(name: "Armadura Sombria", power: 0, pp: 3, attributes: [.doubleBuffDef])
                                ])

fileprivate let GRYPHON = Entity(name: "Grifo",
                                 hp: 1000,
                                 atk: 55,
                                 exa: 55,
                                 def: 40,
                                 spd: 60,
                                 money: 1500,
                                 item: [
                                    .init(name: "Pena de Grifo",
                                          effect: .revive,
                                          size: .large)
                                 ],
                                 abilities: [
                                    .init(name: "Penas mágicas",
                                          power: 0,
                                          pp: 5,
                                          attributes: [.heal, .buffDef]),
                                    .init(name: "Ventania",
                                          power: 1,
                                          pp: 10,
                                          attributes: [.area])
                                 ])

fileprivate let URCAGUARY = Entity(name: "Urcaguary",
                                   hp: 500,
                                   atk: 30,
                                   exa: 30,
                                   def: 30,
                                   spd: 50,
                                   money: 1800,
                                   abilities: [])


fileprivate let NOCK = Entity(name: "Nock",
                              hp: 64,
                              atk: 1,
                              exa: 1,
                              def: 59,
                              spd: 150,
                              summon: nil,
                              money: 1900,
                              item: [],
                              abilities: [
                                .init(name: "Incentivo Reverso",
                                      power: 0,
                                      pp: 10,
                                      attributes: [.doubleBuffAtk]),
                                .init(name: "Crítica Construtiva",
                                      power: 0,
                                      pp: 10,
                                      attributes: [.doubleBuffDef]),
                                .init(name: "Pedala Robinho",
                                      power: 0,
                                      pp: 10,
                                      attributes: [.doubleNerfAtk]),
                                .init(name: "Tu é lerdo em",
                                      power: 0,
                                      pp: 10,
                                      attributes: [.speed])
                              ])

fileprivate let RATMAN = Entity(name: "Ratman",
                                hp: 600,
                                atk: 55,
                                exa: 55,
                                def: 40,
                                spd: 60,
                                abilities: [
                                    .init(name: "f1lh0t3",
                                          power: 3,
                                          pp: 10,
                                          attributes: [.heal])
                                ])

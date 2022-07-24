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
    case froycon2
    case yeti
    case anubis
    case gryphon
    case gryphon2
    case urcaguary
    case nock
    case ratman
    case foroncy
    case leisker
    case ikelos
    case korin
    
    var entity: Entity? {
        switch self {
        case .null:      return nil
        case .okot:      return OKOT
        case .lohan:     return LOHAN
        case .oleg:      return OLEG
        case .froycon:   return FROYCON
        case .froycon2:  return FROYCON2
        case .yeti:      return YETI
        case .anubis:    return ANUBIS
        case .gryphon:   return GRYPHON
        case .gryphon2:  return GRYPHON2
        case .urcaguary: return URCAGUARY
        case .nock:      return NOCK
        case .ratman:    return RATMAN
        case .foroncy:   return FORONCY
        case .leisker:   return LEISKER
        case .ikelos:    return IKELOS
        case .korin:     return KORIN
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
                                              attributes: [.doubleBuffAtk]),
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

fileprivate let FROYCON2: Entity = .init(name: "Froycon (Deus do Pesadelo)",
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

fileprivate let GRYPHON2 = Entity(name: "Grifo",
                                  hp: 300,
                                  atk: 55,
                                  exa: 55,
                                  def: 30,
                                  spd: 60,
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

fileprivate let FORONCY = Entity(name: "Foroncy",
                                 hp: 500,
                                 atk: 60,
                                 exa: 60,
                                 def: 25,
                                 spd: 70,
                                 summon: .IKELOS,
                                 abilities: [
                                    .init(name: "Aura Negra",
                                          power: 0,
                                          pp: 5,
                                          attributes: [.protect]),
                                    .init(name: "Confusão Mental",
                                          power: 1,
                                          pp: 5,
                                          attributes: [.critical]),
                                    .init(name: "Deus do Pesadelo",
                                          power: 0,
                                          pp: 5,
                                          attributes: [.doubleBuffAtk, .doubleBuffDef]),
                                 ])

fileprivate let LEISKER = Entity(name: "Leisker",
                                 hp: 200,
                                 atk: 5,
                                 exa: 45,
                                 def: 25,
                                 spd: 100,
                                 summon: .VENTOLINE,
                                 item: [
                                    .init(name: "Pena de Ventoline",
                                          effect: .speed,
                                          size: .medium)
                                 ],
                                 abilities: [
                                    .init(name: "Cortes de Vento",
                                          power: 1,
                                          pp: 5,
                                          attributes: [.area]),
                                    .init(name: "Vento Espiritual",
                                          power: 0,
                                          pp: 5,
                                          attributes: [.protect])
                                 ])

fileprivate let IKELOS = Entity(name: "Ikelos",
                                hp: 2000,
                                atk: 80,
                                exa: 80,
                                def: 25,
                                spd: 40,
                                money: 3000,
                                item: [
                                    .init(name: "Coroa do Pesadelo",
                                          effect: .buffDef,
                                          size: .large)
                                ],
                                abilities: [
                                    .init(name: "ǎ̶͖r̶̟͝t̴̜̏ö̷̬́ḿ̷̻e̵̜͝n̷̪͂t̸͍̀ä̴̢́r̸̭̄",
                                          power: 0,
                                          pp: 5,
                                          attributes: [.paralyze]),
                                    .init(name: "d̷̞̓e̷̪̓b̶̬̓i̵̜̍l̵͕̿i̷̫̔t̵͈̑a̷͘ͅr̵̘̋",
                                          power: 0,
                                          pp: 5,
                                          attributes: [.doubleNerfAtk, .doubleNerfDef]),
                                    .init(name: "ė̸̜s̸͒͜q̵̻̔u̷͚̕ę̵̀ç̷̈́í̵̩m̸͎͑e̷̥͐n̸͍̂t̴͎͊ò̶̝",
                                          power: 0,
                                          pp: 10,
                                          attributes: [.disable]),
                                    .init(name: "r̵̗̓ẽ̷͓ġ̶̻ě̵̲ṋ̷̓e̵͖̊r̸͇̃a̸͖̕r̷̘͛",
                                          power: 1,
                                          pp: 5,
                                          attributes: [.heal, .buffDef])
                                ])

fileprivate let KORIN = Entity(name: "Korin",
                               hp: 600,
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
                                      attributes: [.critical]),
                                .init(name: "𝔹𝕃𝕆𝕆𝔻 𝕎𝕀ℝ𝔼",
                                      power: 2,
                                      pp: 5,
                                      attributes: [.drain])
                               ])

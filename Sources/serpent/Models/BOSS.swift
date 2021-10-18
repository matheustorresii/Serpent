//
//  File.swift
//  
//
//  Created by Matheus Torres on 29/09/21.
//

import Foundation

fileprivate let ANUBIS = Entity(name: "Anúbis",
                                hp: 500,
                                atk: 40,
                                exa: 50,
                                def: 80,
                                spd: 50,
                                abilities: [
                                  .init(name: "Shadow Ball", power: 1, pp: 10, attributes: []),
                                  .init(name: "Shadow Wave", power: 1, pp: 5, attributes: [.area]),
                                  .init(name: "Shadow Armor", power: 0, pp: 3, attributes: [.buffDef])
                                ])

fileprivate let OKOT = Entity(name: "Okot (Drayden)",
                              hp: 550,
                              atk: 20,
                              exa: 25,
                              def: 100,
                              spd: 18,
                              abilities: [
                                .init(name: "Drenagem", power: 0, pp: 5, attributes: [.narrative]),
                                .init(name: "Chuva de pólen", power: 0, pp: 5, attributes: [.nerfAtk, .nerfDef]),
                                .init(name: "Petrificar", power: 1, pp: 5, attributes: [.disable])
                              ])

fileprivate let TEST_BOSS = Entity(name: "Boss",
                                   hp: 100,
                                   atk: 50,
                                   exa: 50,
                                   def: 50,
                                   spd: 50,
                                   abilities: [
                                    .init(name: "AREA",
                                          power: 1,
                                          pp: 5,
                                          attributes: [.area]),
                                    .init(name: "DISABLED",
                                          power: 0,
                                          pp: 5,
                                          attributes: [.disable]),
                                    .init(name: "PHYSICAL",
                                          power: 1,
                                          pp: 5,
                                          attributes: [.physical])
                                   ])

let CURRENT_BOSS = OKOT

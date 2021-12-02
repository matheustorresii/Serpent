//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

// MARK: - LEVEL 55 (275)

var CHARACTERS: [Entity] = [
    .init(name: "Ayie",
          hp: 48,
          atk: 43,
          exa: 58,
          def: 35,
          spd: 31,
          summon: nil,
          money: 1765,
          item: [],
          abilities: [
            .init(name: "Interdimensional",
                  power: 1,
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
          ]),
    .init(name: "Maha",
          hp: 70,
          atk: 90,
          exa: 5,
          def: 40,
          spd: 10,
          summon: .ZHU_QUE,
          money: 1765,
          item: [
            .init(name: "Esfera de Anúbis Vermelha", effect: .buffAtk, size: .small),
            .init(name: "Pena de Grifo", effect: .revive, size: .large)
          ],
          abilities: [
            .init(name: "Arte família",
                  power: 0,
                  pp: 10,
                  attributes: [.critical, .physical]),
            .init(name: "Manto vermelho",
                  power: 0,
                  pp: 5,
                  attributes: [.protect]),
            .init(name: "Concentração de Zhū Què",
                  power: 0,
                  pp: 10,
                  attributes: [.buffAtk]),
          ]),
    .init(name: "Yareth",
          hp: 1000,
          atk: 1,
          exa: 1,
          def: 1000,
          spd: 1,
          summon: .QUETZALCOATL,
          money: 265,
          item: [],
          abilities: [])
]

var ENEMIES = [Entity]()

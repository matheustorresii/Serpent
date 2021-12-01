//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

// MARK: - LEVEL 43 (215)

var CHARACTERS: [Entity] = [
    .init(name: "Ayie",
          hp: 48,
          atk: 43,
          exa: 58,
          def: 35,
          spd: 31,
          summon: .EMERE,
          money: 100,
          item: [
            .init(name: "Poção de Ressurreição", effect: .revive, size: .medium)
          ],
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
          money: 100,
          item: [
            .init(name: "Poção de Ressurreição", effect: .revive, size: .medium)
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
    .init(name: "Oleg",
          hp: 45,
          atk: 0,
          exa: 45,
          def: 35,
          spd: 90,
          summon: .ULLR,
          money: 100,
          item: [
            .init(name: "Poção de Ressurreição", effect: .revive, size: .medium)
          ],
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
          ]),
    .init(name: "Yareth",
          hp: 1000,
          atk: 1,
          exa: 1,
          def: 1000,
          spd: 1,
          summon: .QUETZALCOATL,
          money: 100,
          item: [],
          abilities: [])
]

var ENEMIES = [Entity]()

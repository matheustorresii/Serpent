//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

// MARK: - LEVEL 31 (155)

var CHARACTERS: [Entity] = [
    .init(name: "Ayie",
          hp: 23,
          atk: 23,
          exa: 43,
          def: 20,
          spd: 26,
          abilities: [
            .init(name: "Interdimensional",
                  power: 1,
                  pp: 5,
                  attributes: [.combo]),
            .init(name: "Necrosador",
                  power: 0,
                  pp: 3,
                  attributes: [.buffAtk]),
            .init(name: "Roubar Vida",
                  power: 1,
                  pp: 5,
                  attributes: [.drain]),
          ]),
    .init(name: "Froycon",
          hp: 30,
          atk: 36,
          exa: 36,
          def: 30,
          spd: 23,
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
          ]),
    .init(name: "Maha",
          hp: 50,
          atk: 60,
          exa: 5,
          def: 30,
          spd: 10,
          abilities: [
            .init(name: "Arte Família",
                  power: 0,
                  pp: 5,
                  attributes: [.critical, .physical]),
            .init(name: "Toque Camarada",
                  power: 0,
                  pp: 5,
                  attributes: [.heal]),
            .init(name: "Concentração de Zhū Què",
                  power: 0,
                  pp: 3,
                  attributes: [.buffAtk]),
          ]),
    .init(name: "Oleg",
          hp: 30,
          atk: 0,
          exa: 35,
          def: 20,
          spd: 70,
          abilities: [
            .init(name: "Ira de Ullr",
                  power: 0,
                  pp: 3,
                  attributes: [.buffAtk]),
            .init(name: "Curaflecha",
                  power: 2,
                  pp: 5,
                  attributes: [.heal]),
            .init(name: "Flechão",
                  power: 35,
                  pp: 1,
                  attributes: [.critical]),
          ]),
    .init(name: "Pimentinha",
          hp: 1000,
          atk: 50,
          exa: 50,
          def: 1000,
          spd: 50,
          abilities: [
            .init(name: "Thurito Power", power: 10, pp: 5, attributes: [.combo]),
            .init(name: "CURA", power: 5, pp: 5, attributes: [.heal]),
            .init(name: "DRENAR", power: 5, pp: 5, attributes: [.drain])
          ])
]

var ENEMIES = [Entity]()

var BOSS = CURRENT_BOSS

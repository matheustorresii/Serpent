//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

// MARK: - LEVEL 27 (135)

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
                  attributes: [.narrative]),
          ]),
    .init(name: "Froycon",
          hp: 30,
          atk: 26,
          exa: 26,
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
                  pp: 2,
                  attributes: [.buffAtk, .buffDef]),
          ]),
    .init(name: "Maha",
          hp: 40,
          atk: 50,
          exa: 5,
          def: 30,
          spd: 10,
          abilities: [
            .init(name: "Katana do Deus do Fogo",
                  power: 1,
                  pp: 5,
                  attributes: [.combo]),
            .init(name: "Arte Família",
                  power: 0,
                  pp: 5,
                  attributes: [.critical, .physical]),
            .init(name: "Concentração de Zhū Què",
                  power: 0,
                  pp: 3,
                  attributes: [.buffAtk]),
          ]),
    .init(name: "Oleg",
          hp: 25,
          atk: 0,
          exa: 30,
          def: 20,
          spd: 60,
          abilities: [
            .init(name: "Já vou lá",
                  power: 0,
                  pp: 5,
                  attributes: [.critical]),
            .init(name: "Curaflecha",
                  power: 2,
                  pp: 5,
                  attributes: [.narrative]),
            .init(name: "Flechão",
                  power: 25,
                  pp: 1,
                  attributes: [.critical]),
          ]),
    .init(name: "Aurora",
          hp: 420,
          atk: 130,
          exa: 100,
          def: 70,
          spd: 50,
          abilities: [
            .init(name: "Perfeitinha",
                  power: 0,
                  pp: 3,
                  attributes: [.nerfDef, .nerfAtk])
          ])
]

var ENEMIES = [Entity]()

var BOSS = CURRENT_BOSS

//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

var CHARACTERS: [Entity] = [
    .init(name: "Ayie",
          hp: 23,
          atk: 23,
          exa: 33,
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
          hp: 20,
          atk: 23,
          exa: 23,
          def: 9,
          spd: 20,
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
          hp: 30,
          atk: 40,
          exa: 5,
          def: 14,
          spd: 6,
          abilities: [
            .init(name: "Katana do Deus do Fogo",
                  power: 1,
                  pp: 5,
                  attributes: [.combo]),
            .init(name: "Arte da Família",
                  power: 0,
                  pp: 5,
                  attributes: [.critical, .physical]),
            .init(name: "Concentração de Zhū Què",
                  power: 0,
                  pp: 3,
                  attributes: [.buffAtk]),
          ]),
    .init(name: "Oleg",
          hp: 23,
          atk: 0,
          exa: 27,
          def: 20,
          spd: 55,
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
                  power: 20,
                  pp: 1,
                  attributes: []),
          ]),
    .init(name: "Seilapoha",
          hp: 1000,
          atk: 50,
          exa: 50,
          def: 50,
          spd: 50,
          abilities: [
            .init(name: "Faz tudo",
                  power: 0,
                  pp: 5,
                  attributes: [.buffDef, .buffAtk, .nerfAtk, .nerfDef]),
            .init(name: "Muito dano",
                  power: 15,
                  pp: 5,
                  attributes: [.critical, .combo]),
            .init(name: "Faz nada",
                  power: 0,
                  pp: 0,
                  attributes: [])
          ])
]

var ENEMIES = [Entity]()

var BOSS = Entity(name: "Hideo",
                  hp: 600,
                  atk: 30,
                  exa: 80,
                  def: 80,
                  spd: 80,
                  abilities: [
                    .init(name: "DANO_EM_ÁREA",
                          power: 5,
                          pp: 5,
                          attributes: [.area])
                  ])

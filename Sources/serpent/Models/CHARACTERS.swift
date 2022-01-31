//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

// MARK: - LEVEL 55 (275)

var CHARACTERS: [Entity] = [
    .init(name: "Anya",
          hp: 100,
          atk: 45,
          exa: 40,
          def: 50,
          spd: 40,
          summon: .NEMESIS,
          money: 1900,
          item: [],
          abilities: [
            .init(name: "RETRIBUIÇÃO",
                  power: 0,
                  pp: 5,
                  attributes: [.counter]),
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
          ]),
    .init(name: "Ayie",
          hp: 68,
          atk: 43,
          exa: 78,
          def: 55,
          spd: 31,
          summon: .EMERE,
          money: 3000,
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
            .init(name: "Cale-se para sempre",
                  power: 0,
                  pp: 10,
                  attributes: [.counter])
          ]),
    .init(name: "Maha",
          hp: 95,
          atk: 100,
          exa: 5,
          def: 65,
          spd: 10,
          summon: .ZHU_QUE,
          money: 4000,
          item: [
            .init(name: "Esfera de Anúbis Vermelha", effect: .buffAtk, size: .small),
            .init(name: "Pena de Grifo", effect: .revive, size: .large)
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
                  pp: 8,
                  attributes: [.physical, .critical])
          ]),
    .init(name: "Nock",
          hp: 64,
          atk: 1,
          exa: 1,
          def: 59,
          spd: 150,
          summon: .MOMO,
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
]

var ENEMIES = [Entity]()

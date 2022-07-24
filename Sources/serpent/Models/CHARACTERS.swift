// LEVEL 75 (375)

// MARK: - REBELS\

let ANYA: Entity = .init(name: "Anya",
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

let AYIE: Entity = .init(name: "Ayie",
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

let MAHA: Entity = .init(name: "Maha",
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

var CHARACTERS: [Entity] = [ANYA, AYIE, MAHA]
var ENEMIES = [Entity]()

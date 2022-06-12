// LEVEL 58 (290)

// MARK: - REBELS

let ANYA: Entity = .init(name: "Anya",
                         hp: 100,
                         atk: 50,
                         exa: 40,
                         def: 60,
                         spd: 40,
                         summon: .NEMESIS,
                         money: 650,
                         item: [
                            .init(name: "Frangoteston", effect: .buffAtk, size: .large),
                            .init(name: "Chicken Chess", effect: .buffDef, size: .large),
                            .init(name: "Licor de Frango", effect: .purify, size: .small)
                         ],
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
                         ])

let AYIE: Entity = .init(name: "Ayie",
                         hp: 76,
                         atk: 43,
                         exa: 85,
                         def: 55,
                         spd: 31,
                         summon: .EMERE,
                         money: 630,
                         item: [
                            .init(name: "Balde de Frango", effect: .heal, size: .large),
                            .init(name: "Balde de Frango", effect: .heal, size: .medium),
                            .init(name: "Balde de Frango", effect: .heal, size: .medium),
                            .init(name: "Coração de Galinha", effect: .revive, size: .medium),
                            .init(name: "Licor de Frango", effect: .purify, size: .small)
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
                         hp: 100,
                         atk: 105,
                         exa: 5,
                         def: 70,
                         spd: 10,
                         summon: .ZHU_QUE,
                         money: 1000,
                         item: [
                            .init(name: "Esfera de Anúbis Vermelha", effect: .buffAtk, size: .small),
                            .init(name: "Pena de Grifo", effect: .revive, size: .large),
                            .init(name: "Balde de Frango", effect: .heal, size: .medium),
                            .init(name: "Frangoteston", effect: .buffAtk, size: .medium),
                            .init(name: "Frangoteston", effect: .buffAtk, size: .medium),
                            .init(name: "Licor de Frango", effect: .purify, size: .small)
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
                         ])

var CHARACTERS: [Entity] = [ANYA, AYIE, MAHA]
var ENEMIES = [Entity]()

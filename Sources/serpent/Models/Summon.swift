//
//  File.swift
//  
//
//  Created by Matheus Torres on 18/11/21.
//

import Foundation

struct Summon {
    let name: String
    let effect: Effect
    
    enum Effect: String {
        case heal
        case buffAtk
        case buffDef
        case protect
        case counter
        case random
        case speed
    }
}

extension Summon {
    static let EMERE: Summon = .init(name: "Emere", effect: .protect)
    static let ZHU_QUE: Summon = .init(name: "Zhū Què", effect: .heal)
    static let ULLR: Summon = .init(name: "Ullr", effect: .speed)
    static let IKELOS: Summon = .init(name: "Ikelos", effect: .buffDef)
    static let QUETZALCOATL: Summon = .init(name: "Quetzalcoatl", effect: .speed)
    static let NEMESIS: Summon = .init(name: "Nêmesis", effect: .counter)
    static let MOMO: Summon = .init(name: "Momo", effect: .random)
    static let VENTOLINE: Summon = .init(name: "Ventoline", effect: .buffAtk)
    static let FENRIR: Summon = .init(name: "Fenrir", effect: .buffDef)
    static let IMPUNDULU: Summon = .init(name: "Impundulu", effect: .buffAtk)
}

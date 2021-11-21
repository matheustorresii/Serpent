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
        case speed
    }
}

extension Summon {
    static let EMERE: Summon = .init(name: "Emere", effect: .protect)
    static let ZHU_QUE: Summon = .init(name: "Zhū Què", effect: .buffAtk)
    static let ULLR: Summon = .init(name: "Ullr", effect: .speed)
    static let IKELOS: Summon = .init(name: "Ikelos", effect: .buffDef)
    static let QUETZALCOATL: Summon = .init(name: "Quetzalcoatl", effect: .speed)
}

//
//  File.swift
//  
//
//  Created by Matheus Torres on 23/03/22.
//

import Foundation

var NPC: Entity?

enum Npcs: String {
    case null
    case yareth
    
    var entity: Entity? {
        switch self {
        case .null: return nil
        case .yareth: return YARETH
        }
    }
}

fileprivate let YARETH = Entity(name: "Yareth",
                                hp: 1000,
                                atk: 1,
                                exa: 1,
                                def: 1000,
                                spd: 1,
                                summon: .QUETZALCOATL,
                                abilities: [
                                    .init(name: "Benção da Serpente",
                                          power: 1,
                                          pp: 10,
                                          attributes: [.heal])
                                ])

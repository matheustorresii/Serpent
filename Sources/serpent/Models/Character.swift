//
//  Characters.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

// Testers:
// 417119513788809218 = Maryana
// 240600043013406720 = Heitor
// Masters:
// 316249647137947648 = BlinkN
// 748944007366705223 = DevDev
// Players:
// 337595162572095510 = Pedrin
// 892539055953305630 = Pedrin 2
// 419197752816173057 = Thiaguin
// 204663989395783680 = Samuel
// 243371249215078400 = Savio

enum Character: String {
    case ayie = "243371249215078400"
    case maha = "419197752816173057"
    
    // MASTERS
    case master = "748944007366705223"
    case substitute = "316249647137947648"
    
    static let playerCount: Int = 2
    
    var entity: Entity {
        return CHARACTERS[exists: index] ?? .init(name: Utils.Strings.error,
                                                  hp: 1,
                                                  atk: 1,
                                                  exa: 1,
                                                  def: 1,
                                                  spd: 1)
    }
    
    var index: Int {
        switch self {
            case .ayie:     return 0
            case .maha:     return 1
            default:        return 1
        }
    }
    
    static func entityWith(name: String) -> Entity {
        switch name.lowercased() {
            case "ayie":    return Character.ayie.entity
            case "maha":    return Character.maha.entity
            default:        return Character.master.entity
        }
    }
    
    static func indexWith(name: String) -> Int {
        switch name.lowercased() {
            case "ayie":    return Character.ayie.index
            case "maha":    return Character.maha.index
            default:        return Character.master.index
        }
    }
}

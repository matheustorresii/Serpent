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
// 419197752816173057 = Thiaguin
// 204663989395783680 = Samuel
// 243371249215078400 = Savio

enum Character: String {
    case ayie = "243371249215078400"
    case froycon = "337595162572095510"
    case maha = "419197752816173057"
    case oleg = "204663989395783680"
    
    // MASTERS
    case master = "748944007366705223"
    case substitute = "316249647137947648"
    
    var entity: Entity {
        return CHARACTERS[exists: index] ?? .init(name: Utils.Strings.error.rawValue,
                                                  hp: 1,
                                                  atk: 1,
                                                  exa: 1,
                                                  def: 1,
                                                  spd: 1,
                                                  abilities: [])
    }
    
    var index: Int {
        switch self {
            case .ayie:     return 0
            case .froycon:  return 1
            case .maha:     return 2
            case .oleg:     return 3
            default:        return 4
        }
    }
    
    static func entityWith(name: String) -> Entity {
        switch name {
            case "ayie":    return Character.ayie.entity
            case "froycon": return Character.froycon.entity
            case "maha":    return Character.maha.entity
            case "oleg":    return Character.oleg.entity
            default:        return Character.master.entity
        }
    }
    
    static func indexWith(name: String) -> Int {
        switch name {
            case "ayie":    return Character.ayie.index
            case "froycon": return Character.froycon.index
            case "maha":    return Character.maha.index
            case "oleg":    return Character.oleg.index
            default:        return Character.master.index
        }
    }
}

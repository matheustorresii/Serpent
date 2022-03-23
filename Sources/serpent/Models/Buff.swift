//
//  File.swift
//  
//
//  Created by Matheus Torres on 31/01/22.
//

import Foundation

enum Buff {
    case none
    case protect
    case counter
    
    var description: String? {
        switch self {
        case .none:    return nil
        case .protect: return "protegido"
        case .counter: return "pronto para revidar"
        }
    }
}

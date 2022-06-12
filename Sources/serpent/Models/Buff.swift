//
//  File.swift
//  
//
//  Created by Matheus Torres on 31/01/22.
//

import Foundation

enum Buff: String {
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
    
    var shouldStop: Bool {
        switch self {
        case .none, .protect, .counter:
            return true
        }
    }
}

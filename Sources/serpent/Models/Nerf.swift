//
//  File.swift
//  
//
//  Created by Matheus Torres on 31/01/22.
//

import Foundation

enum Nerf: String {
    case disabled
    case bleeding
    case paralyzed
    case none
    
    var description: String? {
        switch self {
        case .disabled:  return "desabilitado"
        case .bleeding:  return "sangrando"
        case .paralyzed: return "paralisado"
        case .none:      return nil
        }
    }
    
    
    var shouldStop: Bool {
        switch self {
        case .none, .disabled:
            return true
        case .paralyzed, .bleeding:
            return false
        }
    }
}

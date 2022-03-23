//
//  File.swift
//  
//
//  Created by Matheus Torres on 31/01/22.
//

import Foundation

enum Nerf {
    case disabled
    case bleeding
    case none
    
    var description: String? {
        switch self {
        case .disabled: return "desabilitado"
        case .bleeding: return "sangrando"
        case .none:    return nil
        }
    }
}
//
//  File.swift
//  
//
//  Created by Matheus Torres on 24/10/21.
//

import Foundation

enum Status {
    case quadNerfed
    case tripleNerfed
    case doubleNerfed
    case nerfed
    case normal
    case buffed
    case doubleBuffed
    case tripleBuffed
    case quadBuffed
    
    enum Direction {
        case reduce
        case improve
    }
    
    var multiplier: Double {
        switch self {
        case .quadNerfed:   return 4/8 // x0.50
        case .tripleNerfed: return 4/7 // x0.57
        case .doubleNerfed: return 4/6 // x0.66
        case .nerfed:       return 4/5 // x0.80
        case .normal:       return 4/4 // x1.00
        case .buffed:       return 5/4 // x1.25
        case .doubleBuffed: return 6/4 // x1.50
        case .tripleBuffed: return 7/4 // x1.75
        case .quadBuffed:   return 8/4 // x2.00
        }
    }
    
    var next: Status {
        switch self {
        case .quadNerfed:   return .tripleNerfed
        case .tripleNerfed: return .doubleNerfed
        case .doubleNerfed: return .nerfed
        case .nerfed:       return .normal
        case .normal:       return .buffed
        case .buffed:       return .doubleBuffed
        case .doubleBuffed: return .tripleBuffed
        case .tripleBuffed: return .quadBuffed
        case .quadBuffed:   return .quadBuffed
        }
    }
    
    var previous: Status {
        switch self {
        case .quadNerfed:   return .quadNerfed
        case .tripleNerfed: return .quadNerfed
        case .doubleNerfed: return .tripleNerfed
        case .nerfed:       return .doubleNerfed
        case .normal:       return .nerfed
        case .buffed:       return .normal
        case .doubleBuffed: return .buffed
        case .tripleBuffed: return .doubleBuffed
        case .quadBuffed:   return .tripleBuffed
        }
    }
    
    var description: (String, Direction)? {
        switch self {
        case .quadNerfed:   return ("deprimente", .reduce)
        case .tripleNerfed: return ("extremamente abaixo do normal", .reduce)
        case .doubleNerfed: return ("muito abaixo do normal", .reduce)
        case .nerfed:       return ("abaixo do normal", .reduce)
        case .normal:       return nil
        case .buffed:       return ("acima do normal", .improve)
        case .doubleBuffed: return ("muito acima do normal", .improve)
        case .tripleBuffed: return ("extremamente acima do normal", .improve)
        case .quadBuffed:   return ("surreal", .improve)
        }
    }
}

//
//  File.swift
//  
//
//  Created by Matheus Torres on 24/10/21.
//

import Foundation

enum Status {
    case tripleNerfed
    case doubleNerfed
    case nerfed
    case normal
    case buffed
    case doubleBuffed
    case tripleBuffed
    
    enum Direction {
        case reduce
        case improve
    }
    
    var multiplier: Double {
        switch self {
        case .tripleNerfed: return 0.45
        case .doubleNerfed: return 0.55
        case .nerfed:       return 0.75
        case .normal:       return 1.00
        case .buffed:       return 1.25
        case .doubleBuffed: return 1.50
        case .tripleBuffed: return 1.70
        }
    }
    
    var next: Status {
        switch self {
        case .tripleNerfed: return .doubleNerfed
        case .doubleNerfed: return .nerfed
        case .nerfed:       return .normal
        case .normal:       return .buffed
        case .buffed:       return .doubleBuffed
        case .doubleBuffed: return .tripleBuffed
        case .tripleBuffed: return .tripleBuffed
        }
    }
    
    var previous: Status {
        switch self {
        case .tripleNerfed: return .tripleNerfed
        case .doubleNerfed: return .tripleNerfed
        case .nerfed:       return .doubleNerfed
        case .normal:       return .nerfed
        case .buffed:       return .normal
        case .doubleBuffed: return .buffed
        case .tripleBuffed: return .doubleBuffed
        }
    }
    
    var description: (String, Direction)? {
        switch self {
        case .tripleNerfed: return ("extremamente abaixo do normal", .reduce)
        case .doubleNerfed: return ("muito abaixo do normal", .reduce)
        case .nerfed:       return ("abaixo do normal", .reduce)
        case .normal:       return nil
        case .buffed:       return ("acima do normal", .improve)
        case .doubleBuffed: return ("muito acima do normal", .improve)
        case .tripleBuffed: return ("extremamente acima do normal", .improve)
        }
    }
}

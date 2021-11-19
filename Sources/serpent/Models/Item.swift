//
//  File.swift
//  
//
//  Created by Matheus Torres on 18/11/21.
//

import Foundation

struct Item {
    let name: String
    let effect: Effect
    let size: Size
    
    enum Effect: String {
        case heal
        case revive
        case buffAtk
        case buffDef
        case protect
        
        var description: String {
            switch self {
            case .heal: return "cura"
            case .revive: return "ressurreição"
            case .buffAtk: return "aumento de ataque"
            case .buffDef: return "aumento de defesa"
            case .protect: return "proteção"
            }
        }
    }
    
    enum Size: String {
        case small
        case medium
        case large
        
        var description: String {
            switch self {
            case .small: return "pequeno"
            case .medium: return "médio"
            case .large: return "grande"
            }
        }
    }
}

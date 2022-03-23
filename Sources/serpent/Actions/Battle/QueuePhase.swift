//
//  File.swift
//  
//
//  Created by Matheus Torres on 31/01/22.
//

import Foundation

extension Queue {
    enum Phase {
        case actions
        case target
        case allies
        case items([Item])
        case abilities([Ability])
        
        var reactions: [String] {
            switch self {
            case .actions:
                return ["⚔️", "🪄", "🌟", "📦", "🦘"]
            case .target:
                var emojis: [String] = ["👥"]
                if BOSS != nil {
                    emojis.append("🐉")
                }
                let numbers = (0..<ENEMIES.count).map { Utils.emoji(for: $0 + 1) }
                emojis.append(contentsOf: numbers)
                return emojis
            case .allies:
                return ["⛪️", "🎭", "🔥", "🪕", "🦘"]
            case .items(let items):
                return (0..<items.count).map { return Utils.emoji(for: $0 + 1) }
            case .abilities(let abilities):
                return (0..<abilities.count).map { return Utils.emoji(for: $0 + 1) }
            }
        }
        
        var description: String {
            switch self {
            case .actions: return "Escolha sua ação:"
            case .target: return "Escolha o alvo:"
            case .allies: return "Escolha o aliado:"
            case .items: return "Escolha o item:"
            case .abilities: return "Escolha a habilidade:"
            }
        }
    }
}

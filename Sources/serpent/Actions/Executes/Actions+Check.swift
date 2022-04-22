//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func enemies() {
        if ENEMIES.isEmpty {
            return say("Nenhum inimigo encontrado!", color: .yellow)
        }
        
        let message = ENEMIES.enumerated().map{ "\($1.name) (\($0+1)) está com \($1.currentHp) de HP" }.joined(separator: "\n")
        say(message, color: .yellow)
    }
    
    func players() {
        if CHARACTERS.players.isEmpty {
            return say("Nenhum jogador encontrado!", color: .yellow)
        }
        
        let message = CHARACTERS.players.map { "\($0.name) está com \($0.currentHp) de HP" }.joined(separator: "\n")
        say(message, color: .yellow)
    }
    
    func check() {
        let values = content.split(separator: " ").dropFirst()
        if let lastValue = values.last {
            let entity = getEntity(with: "\(lastValue)")
            check(entity: entity, shouldShowExtra: false)
        } else {
            checkSelf()
        }
    }
    
    fileprivate func checkSelf() {
        guard let character = Character(rawValue: author?.id.description ?? "") else { return idError() }
        check(entity: character.entity, shouldShowExtra: true)
    }
    
    fileprivate func check(entity: Entity, shouldShowExtra: Bool) {
        say("\(entity.name) está com \(entity.currentHp) de HP\(shouldShowExtra ? " e ♀︎\(entity.money)" : "")", color: .yellow)
        if shouldShowExtra {
            let abilitiesMessage = entity.abilities.map {
                return "- \($0.name) possui \($0.pp) de pp -"
            }.joined(separator: "\n")
            say(abilitiesMessage, color: .yellow)
            
            if !entity.items.isEmpty {
                let itemsMessage = entity.items.enumerated().map {
                    return "- Item \($0 + 1): \($1.name) (\($1.effect.description.capitalized) - \($1.size.description.capitalized))"
                }.joined(separator: "\n")
                say(itemsMessage, color: .yellow)
            }
        }
        if let description = entity.buff.description {
            say("\(entity.name) está \(description)!", color: .blue)
        }
        if let description = entity.nerf.description {
            say("\(entity.name) está \(description)!", color: .orange)
        }
        if let (description, direction) = entity.atkStatus.description {
            say("O ataque de \(entity.name) está \(description)!", color: direction == .improve ? .blue : .orange)
        }
        if let (description, direction) = entity.defStatus.description {
            say("A defesa de \(entity.name) está \(description)!", color: direction == .improve ? .blue : .orange)
        }
    }
}

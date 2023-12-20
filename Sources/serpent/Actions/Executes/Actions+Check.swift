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
        CHARACTERS.players.forEach {
            check(entity: $0, shouldShowExtra: true)
        }
    }
    
    func check() {
        let values = messageValues()
        if let lastValue = values.last {
            let entity = getEntity(with: lastValue)
            check(entity: entity, shouldShowExtra: false)
        } else {
            checkSelf()
        }
    }
    
    fileprivate func checkSelf() {
        check(entity: character(), shouldShowExtra: true)
    }
    
    fileprivate func check(entity: Entity, shouldShowExtra: Bool) {
        var message = "\(entity.name) está com \(entity.currentHp) de HP"
        if shouldShowExtra {
            message += "\nCochis: ♀︎\(entity.money)"
            if let ultimate = entity.ultimate {
                message += "\n\(ultimate.name): \(ultimate.charge)/\(ultimate.limit)"
            }
            if !entity.abilities.isEmpty {
                let abilitiesMessage = entity.abilities.enumerated().map {
                    return "- Habilidade \($0 + 1): \($1.name) (\($1.pp)pp)"
                }.joined(separator: "\n")
                message += "\n\nHabilidades:\n\(abilitiesMessage)"
            }
            
            if !entity.items.isEmpty {
                let itemsMessage = entity.items.enumerated().map {
                    return "- Item \($0 + 1): \($1.name) (\($1.effect.description.capitalized) - \($1.size.description.capitalized))"
                }.joined(separator: "\n")
                message += "\n\nItems:\n\(itemsMessage)"
            }
        }
        say(message, color: .yellow)
        if let description = entity.buff.description {
            say("\(entity.name) está \(description)!", color: .blue)
        }
        if let description = entity.nerf.description {
            say("\(entity.name) está \(description)!", color: .orange)
        }
        if let (description, direction) = entity.atkStatus.description {
            say("O ataque de \(entity.name) está \(description)!", color: direction.color)
        }
        if let (description, direction) = entity.defStatus.description {
            say("A defesa de \(entity.name) está \(description)!", color: direction.color)
        }
    }
}

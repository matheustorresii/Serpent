//
//  File.swift
//  
//
//  Created by Matheus Torres on 18/11/21.
//

import Foundation
import Sword

extension Message {
    func summon() {
        guard let character = Character(rawValue: author?.id.description ?? "") else { return idError() }
        summon(from: character.entity, allies: true)
    }
    
    func summon(from entity: Entity, allies: Bool) {
        guard let summon = entity.summon else { return say("\(Utils.Strings.error.rawValue): \(entity.name) não possui um Summon", color: .red) }
        guard var target = allies ? CHARACTERS.dropLast().randomElement() : BOSS else { return }
        
        if summon.effect == .speed {
            say("A velocidade de \(target.name) foi aumentada por \(summon.name)!", color: .green)
        }
        
        if summon.effect == .heal {
            heal(entityId: target.name, with: .random(in: 1...target.hp))
            say("\(target.name) foi curado por \(summon.name)!", color: .green)
        }
        
        if summon.effect == .buffAtk {
            target.atkStatus(.improve)
            say("O ataque de \(target.name) foi aumentado por \(summon.name)!", color: .green)
        }
        
        if summon.effect == .buffDef {
            target.defStatus(.improve)
            say("A defesa de \(target.name) foi aumentado por \(summon.name)!", color: .green)
        }
        
        if summon.effect == .protect {
            target.protected(true)
            say("\(target.name) foi protegido por \(summon.name)!", color: .green)
        }
        
        updateEntity(target)
    }
}

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
        guard let summon = entity.summon else { return say("\(Utils.Strings.error): \(entity.name) não possui um Summon", color: .red) }
        guard var target = allies ? CHARACTERS.players.randomElement() : BOSS else { return }
        
        if summon.effect == .speed {
            say("A velocidade de \(target.name) foi aumentada por \(summon.name)!", color: .green)
        }
        
        if summon.effect == .heal {
            if target.currentHp <= 0 {
                say("\(target.name) está derrotado, ele precisa ser revivido antes.", color: .red)
            } else {
                let newHp = heal(entityId: target.name, with: .random(in: target.hp/4...target.hp/2))
                target.currentHp(newHp)
                say("\(target.name) foi curado por \(summon.name)!", color: .green)
            }
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

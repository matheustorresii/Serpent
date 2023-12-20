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
        summon(from: character(), allies: true)
    }
    
    func bossSummon() {
        guard let boss = BOSS else { return say("\(Utils.Strings.error): Boss não existente", color: .red) }
        summon(from: boss, allies: false)
    }
    
    private func summon(from entity: Entity, allies: Bool) {
        guard let summon = entity.summon else { return say("\(Utils.Strings.error): \(entity.name) não possui um Summon", color: .red) }
        guard let target = allies ? CHARACTERS.players.randomElement() : BOSS else { return }
        summonNamed(summon.name, didUse: summon.effect, targetEntity: target)
    }
    
    private func summonNamed(_ name: String, didUse effect: Summon.Effect, targetEntity: Entity) {
        var target = targetEntity
        
        if effect == .speed {
            say("A velocidade de \(target.name) foi aumentada por \(name)!", color: .green)
        }
        
        if effect == .heal {
            if target.currentHp <= 0 {
                say("\(target.name) está derrotado, ele precisa ser revivido antes.", color: .red)
            } else {
                let newHp = heal(entityId: target.name, with: .random(in: target.hp/4...target.hp/2))
                target.currentHp(newHp)
                say("\(target.name) foi curado por \(name)!", color: .green)
            }
        }
        
        if effect == .buffAtk {
            target.atkStatus(.improve)
            say("O ataque de \(target.name) foi aumentado por \(name)!", color: .green)
        }
        
        if effect == .buffDef {
            target.defStatus(.improve)
            say("A defesa de \(target.name) foi aumentado por \(name)!", color: .green)
        }
        
        if effect == .protect {
            target.buff(.protect)
            say("\(target.name) foi protegido por \(name)!", color: .green)
        }
        
        if effect == .counter {
            target.buff(.counter)
            say("\(name) deixou \(target.name) pronto para revidar o próximo golpe!", color: .green)
        }
        
        if effect == .random {
            let randomable: [Summon.Effect] = [.buffAtk, .buffDef]
            let randomEffect = randomable.randomElement() ?? .buffAtk
            summonNamed(name, didUse: randomEffect, targetEntity: targetEntity)
            return
        }
        
        updateEntity(target)
    }
}

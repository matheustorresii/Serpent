//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func ability() {
        let values = content.split(separator: " ").dropFirst()
        guard let targetId = values.first, let ability = values.last, let abilityIndex = Int(ability) else { return }
        guard let character = Character(rawValue: author?.id.description ?? "") else { return idError() }
        
        doAbility(entityId: character.entity.name,
                  targetId: "\(targetId)",
                  abilityIndex: abilityIndex)
    }
    
    func doAbility(entityId: String, targetId: String, abilityIndex: Int) {
        var entity = getEntity(with: entityId)
        var target = getEntity(with: targetId)
        
        guard let abilityUsed = entity.abilities[exists: abilityIndex-1] else {
            say("\(Utils.Strings.error): Não foi possível achar essa habilidade", color: .red)
            return
        }
        
        if abilityUsed.pp == 0 {
            say("Acabaram suas cargas para esta habilidade!", color: .yellow)
            return
        }
        
        entity.abilities[abilityIndex-1].pp(abilityUsed.pp - 1)
        
        if entity.name == target.name {
            target.abilities[abilityIndex-1].pp(abilityUsed.pp - 1)
        }
        
        // MARK: - CHECKS DISABLED
        
        if entity.nerf == .disabled {
            say("Você não pode usar suas habilidades enquanto está desabilitado!", color: .yellow)
            return
        }
        
        // MARK: - AREA
        
        if abilityUsed.attributes.contains(.area) {
            say("\(entity.name) usou \(abilityUsed.name)", color: .yellow)
            CHARACTERS.players.forEach {
                let (entityDamage, targetDamage) = doDamage(entityId: Utils.Strings.bossId,
                                                            targetId: $0.name,
                                                            basePower: abilityUsed.power,
                                                            isExa: !abilityUsed.attributes.contains(.physical),
                                                            isCrit: abilityUsed.attributes.contains(.critical),
                                                            isCombo: abilityUsed.attributes.contains(.combo))
                entity.stopNerfIfNeeded()
                target.stopBuffIfNeeded()
                entity.subHp(entityDamage)
                target.subHp(targetDamage)
            }
            return
        }
        
        // MARK: - HEAL
        
        if abilityUsed.attributes.contains(.heal) {
            if target.currentHp <= 0 {
                say("\(target.name) está derrotado, ele precisa ser revivido antes.", color: .red)
            } else {
                let randomValue = Int.random(in: 1...(target.hp/2))
                print("heal: \(randomValue) bp: \(abilityUsed.power) total: \(randomValue + abilityUsed.power)")
                let newHp = heal(entityId: targetId, with: randomValue + abilityUsed.power)
                target.currentHp(newHp)
            }
        }
        
        // MARK: - ENDEAVOR
        
        if abilityUsed.attributes.contains(.endeavor) {
            let entityPercentage = Float(entity.currentHp) / Float(entity.hp)
            let newHp = Int(Float(target.hp) * entityPercentage)
            target.currentHp(newHp)
            say("\(entity.name) usou \(abilityUsed.name) em \(target.name) e suas vidas se igualaram!", color: .green)
        }
        
        // MARK: - PURIFY
        
        if abilityUsed.attributes.contains(.purify) {
            target.reset()
            say("\(entity.name) usou \(abilityUsed.name) para purificar \(target.name)!", color: .blue)
        }
        
        // MARK: - REVIVE
        
        if abilityUsed.attributes.contains(.revive) {
            let randomValue = Int.random(in: 1...(target.hp/2))
            print("heal: \(randomValue) bp: \(abilityUsed.power) total: \(randomValue + abilityUsed.power)")
            let newHp = heal(entityId: targetId, with: randomValue + abilityUsed.power)
            target.currentHp(newHp)
        }
        
        // MARK: - SPEED
        
        if abilityUsed.attributes.contains(.speed) {
            say("\(entity.name) usou \(abilityUsed.name) e a velocidade de \(target.name) aumentou por esse turno!", color: .cyan)
        }
        
        // MARK: - BUFF ATK
        
        if abilityUsed.attributes.contains(.buffAtk) {
            target.atkStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e o ataque de \(target.name) aumentou!", color: .green)
        }
        
        // MARK: - DOUBLE BUFF ATK
        
        if abilityUsed.attributes.contains(.doubleBuffAtk) {
            target.atkStatus(.improve)
            target.atkStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e o ataque de \(target.name) aumentou muito!", color: .green)
        }
        
        // MARK: - TRIPLE BUFF ATK
        
        if abilityUsed.attributes.contains(.tripleBuffAtk) {
            target.atkStatus(.improve)
            target.atkStatus(.improve)
            target.atkStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e o ataque de \(target.name) aumentou extremamente!", color: .green)
        }
        
        // MARK: - BUFF DEF
        
        if abilityUsed.attributes.contains(.buffDef) {
            target.defStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e a defesa de \(target.name) aumentou!", color: .green)
        }
        
        // MARK: - DOUBLE BUFF DEF
        
        if abilityUsed.attributes.contains(.doubleBuffDef) {
            target.defStatus(.improve)
            target.defStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e a defesa de \(target.name) aumentou muito!", color: .green)
        }
        
        // MARK: - TRIPLE BUFF DEF
        
        if abilityUsed.attributes.contains(.tripleBuffDef) {
            target.defStatus(.improve)
            target.defStatus(.improve)
            target.defStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e a defesa de \(target.name) aumentou extremamente!", color: .green)
        }
        
        // MARK: - NERF ATK
        
        if abilityUsed.attributes.contains(.nerfAtk) {
            target.atkStatus(.reduce)
            say("\(entity.name) usou \(abilityUsed.name) e o ataque de \(target.name) abaixou!", color: .orange)
        }
        
        // MARK: - DOUBLE NERF ATK
        
        if abilityUsed.attributes.contains(.doubleNerfAtk) {
            target.atkStatus(.reduce)
            target.atkStatus(.reduce)
            say("\(entity.name) usou \(abilityUsed.name) e o ataque de \(target.name) abaixou muito!", color: .orange)
        }
        
        // MARK: - TRIPLE NERF ATK
        
        if abilityUsed.attributes.contains(.tripleNerfAtk) {
            target.atkStatus(.reduce)
            target.atkStatus(.reduce)
            target.atkStatus(.reduce)
            say("\(entity.name) usou \(abilityUsed.name) e o ataque de \(target.name) abaixou extremamente!", color: .orange)
        }
        
        // MARK: - NERF DEF
        
        if abilityUsed.attributes.contains(.nerfDef) {
            target.defStatus(.reduce)
            say("\(entity.name) usou \(abilityUsed.name) e a defesa de \(target.name) abaixou!", color: .orange)
        }
        
        // MARK: - DOUBLE NERF DEF
        
        if abilityUsed.attributes.contains(.doubleNerfDef) {
            target.defStatus(.reduce)
            target.defStatus(.reduce)
            say("\(entity.name) usou \(abilityUsed.name) e a defesa de \(target.name) abaixou muito!", color: .orange)
        }
        
        // MARK: - TRIPLE NERF DEF
        
        if abilityUsed.attributes.contains(.tripleNerfDef) {
            target.defStatus(.reduce)
            target.defStatus(.reduce)
            target.defStatus(.reduce)
            say("\(entity.name) usou \(abilityUsed.name) e a defesa de \(target.name) abaixou extremamente!", color: .orange)
        }
        
        // MARK: - PROTECTED
        
        if abilityUsed.attributes.contains(.protect) {
            target.buff(.protect)
            say("\(entity.name) usou \(abilityUsed.name) e agora \(target.name) está imune ao próximo golpe!", color: .blue)
        }
        
        // MARK: - COUNTER
        
        if abilityUsed.attributes.contains(.counter) {
            target.buff(.counter)
            say("\(entity.name) usou \(abilityUsed.name) e está pronto para revidar o próximo golpe", color: .blue)
        }
        
        // MARK: - DISABLED
        
        if abilityUsed.attributes.contains(.disable) {
            target.nerf(.disabled)
            say("\(entity.name) usou \(abilityUsed.name) e agora \(target.name) está desabilitado e não poderá usar suas habilidades!", color: .orange)
        }
        
        // MARK: - PARALYZE
        
        if abilityUsed.attributes.contains(.paralyze) {
            target.nerf(.paralyzed)
            say("\(entity.name) usou \(abilityUsed.name) e agora \(target.name) está paralizado!", color: .orange)
        }
        
        // MARK: - DAMAGE
        
        if abilityUsed.attributes.contains(where: { $0.shouldDoDamage }) || abilityUsed.attributes.isEmpty {
            say("\(entity.name) usou \(abilityUsed.name)", color: .yellow)
            let (entityDamage, targetDamage) = doDamage(entityId: entityId,
                                                        targetId: targetId,
                                                        basePower: abilityUsed.power,
                                                        isExa: !abilityUsed.attributes.contains(.physical),
                                                        isCrit: abilityUsed.attributes.contains(.critical),
                                                        isCombo: abilityUsed.attributes.contains(.combo))
            entity.stopNerfIfNeeded()
            target.stopBuffIfNeeded()
            entity.subHp(entityDamage)
            target.subHp(targetDamage)
            
            // MARK: - DRAIN
            
            if abilityUsed.attributes.contains(.drain) {
                let newHp = heal(entityId: entityId, with: targetDamage/2)
                entity.currentHp(newHp)
                say("\(entity.name) usou \(abilityUsed.name) para drenar \(target.name)!", color: .yellow)
            }
        }
        
        // MARK: - SUICIDE
        
        if abilityUsed.attributes.contains(.suicide) {
            entity.currentHp(0)
            say("\(entity.name) usou \(abilityUsed.name) e agora ele está morto! :(", color: .red)
        }
        
        updateEntity(entity, target)
    }
}

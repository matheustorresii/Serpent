//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func ability() {
        let values = messageValues()
        guard let targetId = values.first, let ability = values.last, let abilityIndex = Int(ability) else { return }
        guard let technique = character().abilities[exists: abilityIndex-1] else {
            return say("\(Utils.Strings.error): Não foi possível achar essa habilidade", color: .red)
        }
        
        doTechnique(entityId: character().name,
                    targetId: targetId,
                    technique: technique)
    }
    
    func doTechnique(entityId: String, targetId: String, technique: TechniqueProtocol) {
        let entity = getEntity(with: entityId)
        var target = getEntity(with: targetId)
        
        // MARK: - CHECKS ABILITY
        
        if let ability = technique.asAbility() {
            if ability.pp == 0 {
                return say("Acabaram suas cargas para esta habilidade!", color: .yellow)
            }
            
            entity.abilities.find(technique.name)?.pp = ability.pp - 1
            if entity.name == target.name {
                target.abilities.find(technique.name)?.pp = ability.pp - 1
            }
        }
        
        if let ultimate = technique.asUltimate() {
            if ultimate.charge < ultimate.limit {
                return say("\(ultimate.name) não está pronto!", color: .yellow)
            }
            entity.ultimate?.charge = .zero
        }
        
        // MARK: - CHECKS DISABLED
        
        if entity.nerf == .disabled {
            return say("Você não pode usar suas habilidades enquanto está desabilitado!", color: .yellow)
        }
        
        // MARK: - AREA
        
        if technique.attributes.contains(.area) {
            say("\(entity.name) usou \(technique.name)", color: .yellow)
            CHARACTERS.players.forEach {
                let (newEntity, newTarget) = doDamage(entityId: entityId,
                                                      targetId: $0.name,
                                                      technique: technique)
                updateEntity(newEntity, newTarget)
            }
            return
        }
        
        // MARK: - HEAL
        
        if technique.attributes.contains(.heal) {
            if target.currentHp <= 0 {
                say("\(target.name) está derrotado, ele precisa ser revivido antes.", color: .red)
            } else {
                let randomValue = Int.random(in: 1...(target.hp/2))
                print("heal: \(randomValue) bp: \(technique.power) total: \(randomValue + technique.power)")
                let newHp = heal(entityId: targetId, with: randomValue + technique.power)
                target.currentHp(newHp)
            }
        }
        
        // MARK: - ENDEAVOR
        
        if technique.attributes.contains(.endeavor) {
            let entityPercentage = Float(entity.currentHp) / Float(entity.hp)
            let newHp = Int(Float(target.hp) * entityPercentage)
            target.currentHp(newHp)
            say("\(entity.name) usou \(technique.name) em \(target.name) e suas vidas se igualaram!", color: .green)
        }
        
        // MARK: - PURIFY
        
        if technique.attributes.contains(.purify) {
            target.reset()
            say("\(entity.name) usou \(technique.name) para purificar \(target.name)!", color: .blue)
        }
        
        // MARK: - REVIVE
        
        if technique.attributes.contains(.revive) {
            let randomValue = Int.random(in: 1...(target.hp/2))
            print("heal: \(randomValue) bp: \(technique.power) total: \(randomValue + technique.power)")
            let newHp = heal(entityId: targetId, with: randomValue + technique.power)
            target.currentHp(newHp)
        }
        
        // MARK: - SPEED
        
        if technique.attributes.contains(.speed) {
            say("\(entity.name) usou \(technique.name) e a velocidade de \(target.name) aumentou por esse turno!", color: .cyan)
        }
        
        // MARK: - BUFF ATK
        
        if technique.attributes.contains(.buffAtk) {
            target.atkStatus(.improve)
            say("\(entity.name) usou \(technique.name) e o ataque de \(target.name) aumentou!", color: .green)
        }
        
        // MARK: - DOUBLE BUFF ATK
        
        if technique.attributes.contains(.doubleBuffAtk) {
            target.atkStatus(.improve)
            target.atkStatus(.improve)
            say("\(entity.name) usou \(technique.name) e o ataque de \(target.name) aumentou muito!", color: .green)
        }
        
        // MARK: - TRIPLE BUFF ATK
        
        if technique.attributes.contains(.tripleBuffAtk) {
            target.atkStatus(.improve)
            target.atkStatus(.improve)
            target.atkStatus(.improve)
            say("\(entity.name) usou \(technique.name) e o ataque de \(target.name) aumentou extremamente!", color: .green)
        }
        
        // MARK: - BUFF DEF
        
        if technique.attributes.contains(.buffDef) {
            target.defStatus(.improve)
            say("\(entity.name) usou \(technique.name) e a defesa de \(target.name) aumentou!", color: .green)
        }
        
        // MARK: - DOUBLE BUFF DEF
        
        if technique.attributes.contains(.doubleBuffDef) {
            target.defStatus(.improve)
            target.defStatus(.improve)
            say("\(entity.name) usou \(technique.name) e a defesa de \(target.name) aumentou muito!", color: .green)
        }
        
        // MARK: - TRIPLE BUFF DEF
        
        if technique.attributes.contains(.tripleBuffDef) {
            target.defStatus(.improve)
            target.defStatus(.improve)
            target.defStatus(.improve)
            say("\(entity.name) usou \(technique.name) e a defesa de \(target.name) aumentou extremamente!", color: .green)
        }
        
        // MARK: - NERF ATK
        
        if technique.attributes.contains(.nerfAtk) {
            target.atkStatus(.reduce)
            say("\(entity.name) usou \(technique.name) e o ataque de \(target.name) abaixou!", color: .orange)
        }
        
        // MARK: - DOUBLE NERF ATK
        
        if technique.attributes.contains(.doubleNerfAtk) {
            target.atkStatus(.reduce)
            target.atkStatus(.reduce)
            say("\(entity.name) usou \(technique.name) e o ataque de \(target.name) abaixou muito!", color: .orange)
        }
        
        // MARK: - TRIPLE NERF ATK
        
        if technique.attributes.contains(.tripleNerfAtk) {
            target.atkStatus(.reduce)
            target.atkStatus(.reduce)
            target.atkStatus(.reduce)
            say("\(entity.name) usou \(technique.name) e o ataque de \(target.name) abaixou extremamente!", color: .orange)
        }
        
        // MARK: - NERF DEF
        
        if technique.attributes.contains(.nerfDef) {
            target.defStatus(.reduce)
            say("\(entity.name) usou \(technique.name) e a defesa de \(target.name) abaixou!", color: .orange)
        }
        
        // MARK: - DOUBLE NERF DEF
        
        if technique.attributes.contains(.doubleNerfDef) {
            target.defStatus(.reduce)
            target.defStatus(.reduce)
            say("\(entity.name) usou \(technique.name) e a defesa de \(target.name) abaixou muito!", color: .orange)
        }
        
        // MARK: - TRIPLE NERF DEF
        
        if technique.attributes.contains(.tripleNerfDef) {
            target.defStatus(.reduce)
            target.defStatus(.reduce)
            target.defStatus(.reduce)
            say("\(entity.name) usou \(technique.name) e a defesa de \(target.name) abaixou extremamente!", color: .orange)
        }
        
        // MARK: - PROTECTED
        
        if technique.attributes.contains(.protect) {
            target.buff(.protect)
            say("\(entity.name) usou \(technique.name) e agora \(target.name) está imune ao próximo golpe!", color: .blue)
        }
        
        // MARK: - COUNTER
        
        if technique.attributes.contains(.counter) {
            target.buff(.counter)
            say("\(entity.name) usou \(technique.name) e está pronto para revidar o próximo golpe", color: .blue)
        }
        
        // MARK: - DISABLED
        
        if technique.attributes.contains(.disable) {
            target.nerf(.disabled)
            say("\(entity.name) usou \(technique.name) e agora \(target.name) está desabilitado e não poderá usar suas habilidades!", color: .orange)
        }
        
        // MARK: - PARALYZE
        
        if technique.attributes.contains(.paralyze) {
            target.nerf(.paralyzed)
            say("\(entity.name) usou \(technique.name) e agora \(target.name) está paralizado!", color: .orange)
        }
        
        updateEntity(entity, target)
        
        // MARK: - DAMAGE
        
        if technique.attributes.contains(where: { $0.shouldDoDamage }) || technique.attributes.isEmpty {
            say("\(entity.name) usou \(technique.name)", color: .yellow)
            let (newEntity, newTarget) = doDamage(entityId: entityId,
                                                  targetId: targetId,
                                                  technique: technique)
            updateEntity(newEntity, newTarget)
        }
    }
}

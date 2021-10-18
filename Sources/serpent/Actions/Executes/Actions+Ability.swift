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
        guard let targetId = values.first, let last = values.last, let lastInt = Int(last) else { return }
        guard let character = Character(rawValue: author?.id.description ?? "") else {
            say(Utils.Strings.error.rawValue, color: .red)
            id()
            return
        }
        doAbility(entityUsingAbility: character.entity, targetId: "\(targetId)", abilityInt: lastInt)
    }
    
    func doAbility(entityUsingAbility: Entity, targetId: String, abilityInt: Int) {
        var entity = entityUsingAbility
        guard let abilityUsed = entity.abilities[exists: abilityInt-1] else {
            say("\(Utils.Strings.error.rawValue): Não foi possível achar essa habilidade", color: .red)
            return
        }
        if abilityUsed.pp == 0 {
            say("Acabaram suas cargas para esta habilidade!", color: .yellow)
            return
        }
        entity.abilities[abilityInt-1].pp(abilityUsed.pp - 1)
        var target = getEntity(with: targetId)
        
        // MARK: - CHECKS DISABLED
        
        if entity.disabled {
            say("Você não pode usar suas habilidades enquanto está desabilitado!", color: .yellow)
            return
        }
        
        // MARK: - AREA
        
        if abilityUsed.attributes.contains(.area) {
            say("\(BOSS.name) usou \(abilityUsed.name)", color: .yellow)
            for currentCharacter in CHARACTERS {
                _ = doDamage(striker: BOSS,
                             targetName: currentCharacter.name.lowercased(),
                             basePower: abilityUsed.power,
                             isExa: !abilityUsed.attributes.contains(.physical),
                             isCrit: abilityUsed.attributes.contains(.critical),
                             isCombo: abilityUsed.attributes.contains(.combo))
            }
            return
        }
        
        // MARK: - HEAL
        
        if abilityUsed.attributes.contains(.heal) {
            let randomValue = Int.random(in: 1...(target.hp/2))
            print("heal: \(randomValue) bp: \(abilityUsed.power) total: \(randomValue + abilityUsed.power)")
            heal(entity: &target, with: randomValue + abilityUsed.power)
        }
        
        // MARK: - BUFF ATK
        
        if abilityUsed.attributes.contains(.buffAtk) {
            entity.atkStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e seu ataque aumentou!", color: .green)
        }
        
        // MARK: - DOUBLE BUFF ATK
        
        if abilityUsed.attributes.contains(.doubleBuffAtk) {
            entity.atkStatus(.improve)
            entity.atkStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e seu ataque aumentou muito!", color: .green)
        }
        
        // MARK: - BUFF DEF
        
        if abilityUsed.attributes.contains(.buffDef) {
            entity.defStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e sua defesa aumentou!", color: .green)
        }
        
        // MARK: - DOUBLE BUFF DEF
        
        if abilityUsed.attributes.contains(.doubleBuffDef) {
            entity.defStatus(.improve)
            entity.defStatus(.improve)
            say("\(entity.name) usou \(abilityUsed.name) e sua defesa aumentou muito!", color: .green)
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
        
        // MARK: - PROTECTED
        
        if abilityUsed.attributes.contains(.protect) {
            entity.protected(true)
            say("\(entity.name) usou \(abilityUsed.name) e está imune ao próximo golpe!", color: .blue)
        }
        
        // MARK: - DISABLED
        
        if abilityUsed.attributes.contains(.disable) {
            target.disabled(true)
            say("\(entity.name) usou \(abilityUsed.name) e agora \(target.name) está desabilitado e não poderá usar suas habilidades!", color: .orange)
        }
        
        // MARK: - DAMAGE
        
        // UpdateEntities antes do damage pra chegar a dar o dano sem sobrescrever os buffs/nerfs
        updateEntities(entity, target)
        
        if abilityUsed.attributes.contains(where: { $0.shouldDoDamage }) {
            say("\(entity.name) usou \(abilityUsed.name)", color: .yellow)
            let damage = doDamage(striker: entity,
                                  targetName: "\(targetId)",
                                  basePower: abilityUsed.power,
                                  isExa: !abilityUsed.attributes.contains(.physical),
                                  isCrit: abilityUsed.attributes.contains(.critical),
                                  isCombo: abilityUsed.attributes.contains(.combo))
            
            // MARK: - DRAIN
            if abilityUsed.attributes.contains(.drain) {
                say("\(entity.name) usou \(abilityUsed.name) para drenar \(target.name)!", color: .yellow)
                heal(entity: &entity, with: damage/2)
                updateEntity(entity)
            }
        }
    }
}

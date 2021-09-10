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
        entity.abilities[abilityInt-1].pp(abilityUsed.pp - 1)
        var target = getEntity(with: targetId)
        
        // MARK: - AREA
        
        if abilityUsed.attributes.contains(.area) {
            say("\(BOSS.name) usou \(abilityUsed.name)", color: .yellow)
            for currentCharacter in CHARACTERS {
                doDamage(striker: BOSS,
                         targetName: currentCharacter.name.lowercased(),
                         basePower: abilityUsed.power,
                         isExa: !abilityUsed.attributes.contains(.physical),
                         isCrit: abilityUsed.attributes.contains(.critical),
                         isCombo: abilityUsed.attributes.contains(.combo))
            }
            return
        }
        
        // MARK: - BUFF ATK
        
        if abilityUsed.attributes.contains(.buffAtk) {
            if entity.atkNerfed {
                entity.atkBuffed(false)
                entity.atkNerfed(false)
                say("\(entity.name) usou \(abilityUsed.name) e seu ataque voltou ao normal!", color: .yellow)
            } else {
                entity.atkBuffed(true)
                say("\(entity.name) usou \(abilityUsed.name) e seu ataque aumentou!", color: .green)
            }
        }
        
        // MARK: - BUFF DEF
        
        if abilityUsed.attributes.contains(.buffDef) {
            if entity.defNerfed {
                entity.defBuffed(false)
                entity.defNerfed(false)
                say("\(entity.name) usou \(abilityUsed.name) e sua defesa voltou ao normal!", color: .yellow)
            } else {
                entity.defBuffed(true)
                say("\(entity.name) usou \(abilityUsed.name) e sua defesa aumentou!", color: .green)
            }
        }
        
        // MARK: - NERF ATK
        
        if abilityUsed.attributes.contains(.nerfAtk) {
            if target.atkBuffed {
                target.atkBuffed(false)
                target.atkNerfed(false)
                say("\(entity.name) usou \(abilityUsed.name) e o ataque de \(target.name) voltou ao normal!", color: .yellow)
            } else {
                target.atkNerfed(true)
                say("\(entity.name) usou \(abilityUsed.name) e o ataque de \(target.name) abaixou!", color: .orange)
            }
        }
        
        // MARK: - NERF DEF
        
        if abilityUsed.attributes.contains(.nerfDef) {
            if target.defBuffed {
                target.defBuffed(false)
                target.defNerfed(false)
                say("\(entity.name) usou \(abilityUsed.name) e a defesa de \(target.name) voltou ao normal!", color: .yellow)
            } else {
                target.defNerfed(true)
                say("\(entity.name) usou \(abilityUsed.name) e a defesa de \(target.name) abaixou!", color: .orange)
            }
        }
        
        // MARK: - PROTECTED
        
        if abilityUsed.attributes.contains(.protect) {
            entity.protected(true)
            say("\(entity.name) usou \(abilityUsed.name) e está imune ao próximo golpe!", color: .blue)
        }
        
        if abilityUsed.attributes.contains(.combo)
            || abilityUsed.attributes.contains(.critical)
            || abilityUsed.attributes.contains(.narrative)
            || abilityUsed.attributes.contains(.physical)
            || abilityUsed.power > 0 {
            say("\(entity.name) usou \(abilityUsed.name)", color: .yellow)
            doDamage(striker: entity,
                     targetName: "\(targetId)",
                     basePower: abilityUsed.power,
                     isExa: !abilityUsed.attributes.contains(.physical),
                     isCrit: abilityUsed.attributes.contains(.critical),
                     isCombo: abilityUsed.attributes.contains(.combo))
        } else {
            // MARK: - UPDATE ENTITIES
            // Não sobrescrever o update do "doDamage()"
            updateEntities(entity, target)
        }
    }
}

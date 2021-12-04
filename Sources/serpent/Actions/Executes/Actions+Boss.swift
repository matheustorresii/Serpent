//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func boss() {
        let values = content.split(separator: " ").dropFirst()
        guard let targetId = values.first else { return }
        if values.count == 1 {
            bossAttack(targetId: "\(targetId)")
        } else {
            guard let ability = values.last, let abilityIndex = Int(ability) else { return }
            bossAbility(targetId: "\(targetId)", abilityIndex: abilityIndex)
        }
    }
    
    func bossSummon() {
        summon(from: BOSS, allies: false)
    }
    
    fileprivate func bossAttack(targetId: String) {
        var entity = getEntity(with: Utils.Strings.bossId)
        var target = getEntity(with: targetId)
        
        let (entityDamage, targetDamage) = doDamage(entityId: Utils.Strings.bossId, targetId: targetId)
        
        entity.subHp(entityDamage)
        target.subHp(targetDamage)
        
        updateEntity(entity, target)
    }
    
    fileprivate func bossAbility(targetId: String, abilityIndex: Int) {
        doAbility(entityId: Utils.Strings.bossId, targetId: targetId, abilityIndex: abilityIndex)
    }
}

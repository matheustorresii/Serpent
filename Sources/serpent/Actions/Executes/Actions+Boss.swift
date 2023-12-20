//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func boss() {
        let values = messageValues()
        guard let targetId = values.first else { return }
        if values.count == 1 {
            bossAttack(targetId: "\(targetId)")
        } else {
            guard let ability = values.last, let abilityIndex = Int(ability) else { return }
            guard let technique = BOSS?.abilities[exists: abilityIndex-1] else {
                return say("\(Utils.Strings.error): Não foi possível achar essa habilidade", color: .red)
            }
            bossAbility(targetId: targetId, technique: technique)
        }
    }
    
    func setBoss() {
        let values = messageValues()
        guard let bossName = values.last else { return }
        guard let newBoss = Bosses(rawValue: "\(bossName)") else {
            return say("\(Utils.Strings.error): Este BOSS não está registrado!", color: .red)
        }
        say("\(BOSS?.name ?? "null") foi substituído por \(newBoss.entity?.name ?? "null")!", color: .yellow)
        BOSS = newBoss.entity
    }
    
    fileprivate func bossAttack(targetId: String) {
        let (newEntity, newTarget) = doDamage(entityId: Utils.Strings.bossId, targetId: targetId)
        updateEntity(newEntity, newTarget)
    }
    
    fileprivate func bossAbility(targetId: String, technique: TechniqueProtocol) {
        doTechnique(entityId: Utils.Strings.bossId, targetId: targetId, technique: technique)
    }
}

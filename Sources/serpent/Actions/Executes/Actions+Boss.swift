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
    
    fileprivate func bossAttack(targetId: String) {
        _ = doDamage(striker: BOSS, targetName: targetId)
    }
    
    fileprivate func bossAbility(targetId: String, abilityIndex: Int) {
        doAbility(entityId: "boss", targetId: targetId, abilityIndex: abilityIndex)
    }
}

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
        guard let firstValue = values.first else { return }
        let targetId = "\(firstValue)"
        if values.count == 1 {
            bossAttack(targetId: targetId)
        } else {
            guard let lastValue = values.last, let lastInt = Int(lastValue) else { return }
            bossAbility(targetId: targetId, abilityIndex: lastInt)
        }
    }
    
    func area() {
        
    }
    
    fileprivate func bossAttack(targetId: String) {
        doDamage(striker: BOSS, targetName: targetId)
    }
    
    fileprivate func bossAbility(targetId: String, abilityIndex: Int) {
        doAbility(entityUsingAbility: BOSS, targetId: targetId, abilityInt: abilityIndex)
    }
}

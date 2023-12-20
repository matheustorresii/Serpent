//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func heal() {
        let values = messageValues()
        guard let entityId = values.first,
              let lastValue = values.last,
              let value = Int(lastValue) else { return }
        
        var entity = getEntity(with: entityId)
        let newHp = heal(entityId: entityId, with: value)
        entity.currentHp(newHp)
        updateEntity(entity)
    }
    
    func heal(entityId: String, with value: Int) -> Int {
        let entity = getEntity(with: entityId)
        let newHp = getNewHp(for: entity, with: value)
        say("\(entity.name) foi curado e agora possui \(newHp) de HP", color: .green)
        return newHp
    }
    
    fileprivate func getNewHp(for entity: Entity, with value: Int) -> Int {
        let healed = entity.currentHp + value
        let newHp = min(entity.hp, healed)
        return newHp
    }
}

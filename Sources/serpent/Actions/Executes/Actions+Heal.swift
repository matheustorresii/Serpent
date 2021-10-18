//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func heal() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first,
              let lastValue = values.last,
              let value = Int(lastValue) else { return }
        
        var entity = getEntity(with: "\(entityId)")
        heal(entity: &entity, with: value)
    }
    
    func heal(entity: inout Entity, with value: Int) {
        let newHp = getNewHp(for: entity, with: value)
        entity.currentHp(newHp)
        say("\(entity.name) foi curado e agora possui \(entity.currentHp) de HP", color: .green)
        updateEntity(entity)
    }
    
    fileprivate func getNewHp(for entity: Entity, with value: Int) -> Int {
        let healed = entity.currentHp + value
        let newHp = min(entity.hp, healed)
        return newHp
    }
}

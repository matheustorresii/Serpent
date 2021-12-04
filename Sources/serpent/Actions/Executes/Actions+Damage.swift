//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func damage() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first, let targetId = values.last else { return }

        var entity = getEntity(with: "\(entityId)")
        var target = getEntity(with: "\(targetId)")
        
        let (entityDamage, targetDamage) = doDamage(entityId: "\(entityId)", targetId: "\(targetId)")
        
        entity.subHp(entityDamage)
        target.subHp(targetDamage)
        
        updateEntity(entity, target)
    }
}

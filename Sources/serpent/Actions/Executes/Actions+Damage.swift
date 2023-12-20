//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func damage() {
        let values = messageValues()
        guard let entityId = values.first, let targetId = values.last else { return }
        let (newEntity, newTarget) = doDamage(entityId: entityId, targetId: targetId)
        updateEntity(newEntity, newTarget)
    }
}

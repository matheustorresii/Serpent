//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func attack(isExtension: Bool) {
        guard let targetId = messageValues().first else { return }
        let (newEntity, newTarget) = doDamage(entityId: character().name,
                                              targetId: targetId,
                                              isExa: isExtension)
        
        updateEntity(newEntity, newTarget)
    }
}

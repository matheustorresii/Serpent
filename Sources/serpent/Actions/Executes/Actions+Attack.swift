//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func attack(isExtension: Bool) {
        let values = content.split(separator: " ").dropFirst()
        guard let targetId = values.first else { return }
        guard let character = Character(rawValue: author?.id.description ?? "") else { return idError() }
        var entity = character.entity
        var target = getEntity(with: "\(targetId)")
        if character.entity.nerf == .disabled {
            entity.nerf(.none)
            say("\(character.entity.name) não está mais desabilitado!", color: .yellow)
        }
        let (entityDamage, targetDamage) = doDamage(entityId: character.entity.name,
                                                    targetId: "\(targetId)",
                                                    basePower: 0,
                                                    isExa: isExtension)
        entity.stopNerfIfNeeded()
        target.stopBuffIfNeeded()
        entity.subHp(entityDamage)
        target.subHp(targetDamage)
        updateEntity(entity, target)
    }
}

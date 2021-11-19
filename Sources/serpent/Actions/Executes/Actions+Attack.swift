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
        guard let targetName = values.first else { return }
        guard let character = Character(rawValue: author?.id.description ?? "") else { return idError() }
        if character.entity.disabled {
            var entity = character.entity
            entity.disabled(false)
            updateEntity(entity)
            say("\(character.entity.name) não está mais desabilitado!", color: .yellow)
        }
        _ = doDamage(striker: character.entity, targetName: "\(targetName)", basePower: 0, isExa: isExtension)
    }
}

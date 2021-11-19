//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func rest() {
        let values = content.split(separator: " ").dropFirst()
        guard let value = values.first, let index = Int(value) else { return }
        guard let character = Character(rawValue: author?.id.description ?? "") else { return idError() }
        var entity = character.entity
        guard entity.abilities[exists: index - 1] != nil else { return }
        let currentPP = entity.abilities[index - 1].pp
        entity.abilities[index - 1].pp(currentPP + 1)
        say("\(entity.name) recuperou sua habilidade \(entity.abilities[index - 1].name) e agora possui \(entity.abilities[index - 1].pp) de pp", color: .yellow)
        updateEntity(entity)
    }
}

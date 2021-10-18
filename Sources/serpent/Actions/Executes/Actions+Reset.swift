//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func reset() {
        for character in CHARACTERS {
            var entity = getEntity(with: character.name.lowercased())
            entity.atkBuffed(false)
            entity.defBuffed(false)
            entity.atkNerfed(false)
            entity.defNerfed(false)
            entity.protected(false)
            entity.disabled(false)
            updateEntity(entity)
        }
        say("Todos os atributos dos jogadores voltaram ao normal!", color: .yellow)
    }
}

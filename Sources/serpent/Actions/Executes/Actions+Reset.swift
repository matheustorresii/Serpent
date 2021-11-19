//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func reset() {
        CHARACTERS.forEach {
            var entity = getEntity(with: $0.name)
            entity.reset()
            updateEntity(entity)
        }
        say("Todos os atributos dos jogadores voltaram ao normal!", color: .yellow)
    }
}

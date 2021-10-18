//
//  File.swift
//  
//
//  Created by Matheus Torres on 29/09/21.
//

import Sword

extension Message {
    
    private enum Stat {
        case buffAtk
        case buffDef
        case nerfAtk
        case nerfDef
        case protect
        case disable
    }
    
    func atk() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first,
              let directionId = values.last else { return }
        var entity = getEntity(with: entityId.lowercased())
        let direction: Status.Direction = directionId == "+" ? .improve : .reduce
        entity.atkStatus(direction)
        say("O ataque de \(entity.name) \(direction == .improve ? "aumentou" : "abaixou")!",
            color: direction == .improve ? .blue : .orange)
        updateEntity(entity)
    }
    
    func def() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first,
              let directionId = values.last else { return }
        var entity = getEntity(with: entityId.lowercased())
        let direction: Status.Direction = directionId == "+" ? .improve : .reduce
        entity.defStatus(direction)
        say("A defesa de \(entity.name) \(direction == .improve ? "aumentou" : "abaixou")!",
            color: direction == .improve ? .blue : .orange)
        updateEntity(entity)
    }
    
    func protect() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first else { return }
        var entity = getEntity(with: entityId.lowercased())
        entity.protected(true)
        say("\(entity.name) está protegido!", color: .blue)
        updateEntity(entity)
    }
    
    func disable() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first else { return }
        var entity = getEntity(with: entityId.lowercased())
        entity.disabled(true)
        say("\(entity.name) está desabilitado!", color: .orange)
        updateEntity(entity)
    }
}

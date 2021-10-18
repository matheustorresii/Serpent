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
    
    func buffAtk() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first else { return }
        var entity = getEntity(with: entityId.lowercased())
        if entity.atkNerfed {
            entity.atkBuffed(false)
            entity.atkNerfed(false)
            say("O ataque de \(entity.name) voltou ao normal!", color: .yellow)
        } else {
            entity.atkBuffed(true)
            say("O ataque de \(entity.name) aumentou!", color: .green)
        }
        updateEntity(entity)
    }
    
    func buffDef() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first else { return }
        var entity = getEntity(with: entityId.lowercased())
        if entity.defNerfed {
            entity.defBuffed(false)
            entity.defNerfed(false)
            say("A defesa de \(entity.name) voltou ao normal!", color: .yellow)
        } else {
            entity.defBuffed(true)
            say("A defesa de \(entity.name) aumentou!", color: .green)
        }
        updateEntity(entity)
    }
    
    func nerfAtk() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first else { return }
        var entity = getEntity(with: entityId.lowercased())
        if entity.atkBuffed {
            entity.atkBuffed(false)
            entity.atkNerfed(false)
            say("O ataque de \(entity.name) voltou ao normal!", color: .yellow)
        } else {
            entity.atkNerfed(true)
            say("O ataque de \(entity.name) abaixou!", color: .orange)
        }
        updateEntity(entity)
    }
    
    func nerfDef() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first else { return }
        var entity = getEntity(with: entityId.lowercased())
        if entity.defBuffed {
            entity.defBuffed(false)
            entity.defNerfed(false)
            say("A defesa de \(entity.name) voltou ao normal!", color: .yellow)
        } else {
            entity.defNerfed(true)
            say("A defesa de \(entity.name) abaixou!", color: .orange)
        }
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

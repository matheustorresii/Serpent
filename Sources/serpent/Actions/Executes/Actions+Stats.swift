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
        guard let entityId = values.first, let directionId = values.last else { return }
        var entity = getEntity(with: "\(entityId)")
        let direction: Status.Direction = directionId == "+" ? .improve : .reduce
        entity.atkStatus(direction)
        say("O ataque de \(entity.name) \(direction.description)!", color: direction.color)
        updateEntity(entity)
    }
    
    func def() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first,
              let directionId = values.last else { return }
        var entity = getEntity(with: "\(entityId)")
        let direction: Status.Direction = directionId == "+" ? .improve : .reduce
        entity.defStatus(direction)
        say("A defesa de \(entity.name) \(direction.description)!", color: direction.color)
        updateEntity(entity)
    }
    
    func buff() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first,
              let buffId = values.last,
              let buff = Buff(rawValue: "\(buffId)") else {
            return say("\(values.last ?? "") não existe", color: .red)
        }
        var entity = getEntity(with: "\(entityId)")
        entity.buff(buff)
        say("\(entity.name) agora está \(buff.description ?? "")!", color: .blue)
        updateEntity(entity)
    }
    
    func nerf() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first,
              let nerfId = values.last,
              let nerf = Nerf(rawValue: "\(nerfId)") else {
            return say("\(values.last ?? "") não existe", color: .red)
        }
        var entity = getEntity(with: "\(entityId)")
        entity.nerf(nerf)
        say("\(entity.name) agora está \(nerf.description ?? "")!", color: .orange)
        updateEntity(entity)
    }
    
    func purify() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first else { return }
        var entity = getEntity(with: "\(entityId)")
        entity.reset()
        say("\(entity.name) está purificado!", color: .blue)
        updateEntity(entity)
    }
}

//
//  File.swift
//  
//
//  Created by Matheus Torres on 18/11/21.
//

import Foundation
import Sword

extension Message {
    func item() {
        let values = content.split(separator: " ").dropFirst()
        guard let targetId = values.first, let item = values.last, let itemIndex = Int(item) else { return }
        guard let character = Character(rawValue: author?.id.description ?? "") else { return idError() }
        doItem(entityId: character.entity.name,
               targetId: "\(targetId)",
               itemIndex: itemIndex)
    }
    
    func removeItem() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first, let itemId = values.last, let itemIndex = Int(itemId) else { return }
        let index = itemIndex-1
        var entity = getEntity(with: "\(entityId)")
        guard let _ = entity.items[exists: index] else {
            return say("\(Utils.Strings.error): Este player não possui esse item", color: .red)
        }
        say("O item \(entity.items[index].name) foi retirado de \(entity.name)!", color: .yellow)
        entity.items.remove(at: index)
        updateEntity(entity)
    }
    
    private func doItem(entityId: String, targetId: String, itemIndex: Int) {
        var entity = getEntity(with: "\(entityId)")
        var target = getEntity(with: "\(targetId)")
        
        guard let item = entity.items[exists: itemIndex-1] else {
            return say("\(Utils.Strings.error): Não foi possível encontrar esse item!", color: .red)
        }
        
        // MARK: - HEAL & REVIVE
        
        if item.effect == .heal || item.effect == .revive {
            if target.currentHp <= 0, item.effect == .heal {
                say("\(target.name) está derrotado, ele precisa ser revivido antes.", color: .red)
                return
            }
            var newHp: Int
            switch item.size {
            case .small:
                newHp = heal(entityId: target.name, with: target.hp/4)
            case .medium:
                newHp = heal(entityId: target.name, with: target.hp/2)
            case .large:
                newHp = heal(entityId: target.name, with: target.hp/1)
            }
            target.currentHp(newHp)
        }
        
        // MARK: - PURIFY
        
        if item.effect == .purify {
            target.reset()
            say("\(entity.name) usou \(item.name) e purificou \(target.name)!", color: .green)
        }
        
        // MARK: - SPEED
        
        if item.effect == .speed {
            say("\(entity.name) usou \(item.name) e agora \(target.name) está mais rápido!", color: .blue)
        }
        
        // MARK: - BUFF ATK
        
        if item.effect == .buffAtk {
            switch item.size {
            case .small:
                target.atkStatus(.improve)
                say("\(entity.name) usou \(item.name) e o ataque de \(target.name) aumentou!", color: .green)
            case .medium:
                target.atkStatus(.improve)
                target.atkStatus(.improve)
                say("\(entity.name) usou \(item.name) e o ataque de \(target.name) aumentou muito!", color: .green)
            case .large:
                target.atkStatus(.improve)
                target.atkStatus(.improve)
                target.atkStatus(.improve)
                say("\(entity.name) usou \(item.name) e o ataque de \(target.name) teve um aumento extremo!", color: .green)
            }
        }
        
        // MARK: - BUFF DEF
        
        if item.effect == .buffDef {
            switch item.size {
            case .small:
                target.defStatus(.improve)
                say("\(entity.name) usou \(item.name) e a defesa de \(target.name) aumentou!", color: .green)
            case .medium:
                target.defStatus(.improve)
                target.defStatus(.improve)
                say("\(entity.name) usou \(item.name) e a defesa de \(target.name) aumentou muito!", color: .green)
            case .large:
                target.defStatus(.improve)
                target.defStatus(.improve)
                target.defStatus(.improve)
                say("\(entity.name) usou \(item.name) e a defesa de \(target.name) teve um aumento extremo!", color: .green)
            }
        }
        
        // MARK: - PROTECT
        
        if item.effect == .protect {
            target.buff(.protect)
            say("\(entity.name) usou \(item.name) e protegeu \(target.name)!", color: .green)
        }

        // MARK: - REMOVE ITEM & UPDATE ENTITIES
        
        entity.items.remove(at: itemIndex-1)
        updateEntity(entity, target)
    }
    
    func itemsToPlayers(_ items: [Item]) {
        items.forEach { item in
            guard let player = CHARACTERS.players.randomElement() else { return }
            give(item: item, to: player.name)
        }
    }
}


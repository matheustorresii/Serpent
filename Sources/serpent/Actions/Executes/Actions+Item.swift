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
    
    private func doItem(entityId: String, targetId: String, itemIndex: Int) {
        var entity = getEntity(with: "\(entityId)")
        var target = getEntity(with: "\(targetId)")
        
        guard let item = entity.items[exists: itemIndex-1] else {
            return say("\(Utils.Strings.error.rawValue): Não foi possível encontrar esse item!", color: .red)
        }
        
        // MARK: - HEAL & REVIVE
        
        if item.effect == .heal || item.effect == .revive {
            if target.currentHp <= 0, item.effect == .heal {
                say("\(target.name) está derrotado, ele precisa ser revivido antes.", color: .red)
                return
            }
            switch item.size {
            case .small:
                heal(entityId: target.name, with: target.hp/4)
            case .medium:
                heal(entityId: target.name, with: target.hp/2)
            case .large:
                heal(entityId: target.name, with: target.hp/1)
            }
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
        
        // MARK: - NERF ATK
        
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
            target.protected(true)
            say("\(entity.name) usou \(item.name) e protegeu \(target.name)!", color: .green)
        }

        // MARK: - REMOVE ITEM & UPDATE ENTITIES
        
        entity.items.remove(at: itemIndex-1)
        updateEntities(entity, target)
    }
    
    func itemsToPlayers(_ items: [Item]) {
        items.forEach { item in
            guard let player = CHARACTERS.dropLast().randomElement() else { return }
            give(item: item, to: player.name)
        }
    }
}


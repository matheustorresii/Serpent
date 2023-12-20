//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func getEntity(with id: String) -> Entity {
        if id == Utils.Strings.bossId, let boss = BOSS {
            return boss
        } else if let index = Int(id), let enemy = ENEMIES[exists: index - 1] {
            return enemy
        } else {
            return Entity.getEntityWith(name: id)
        }
    }
    
    func updateEntity(_ entities: Entity...) {
        entities.forEach { update(entity: $0) }
    }
    
    fileprivate func update(entity: Entity) {
        if entity.name == BOSS?.name {
            BOSS = entity
            if entity.currentHp < 1 {
                loot(entity: entity)
            }
        } else if entity.name == NPC?.name {
            NPC = entity
        } else if CHARACTERS.contains(where: { $0.name == entity.name }) {
            guard let index = index(from: CHARACTERS, with: entity.name),
                  CHARACTERS[exists: index] != nil else { return }
            CHARACTERS[index] = entity
        } else if ENEMIES.contains(where: { $0.name == entity.name }) {
            guard let index = index(from: ENEMIES, with: entity.name),
                  ENEMIES[exists: index] != nil else { return }
            ENEMIES[index] = entity
            if entity.currentHp < 1 {
                ENEMIES.remove(at: index)
                loot(entity: entity)
            }
        }
    }
    
    fileprivate func loot(entity: Entity) {
        moneyToPlayers(entity.money)
        itemsToPlayers(entity.items)
    }
    
    fileprivate func index(from collection: [Entity], with name: String) -> Int? {
        guard let index = collection.firstIndex(where: { $0.name == name }) else {
            say("\(Utils.Strings.error): Não foi possível achar o index de \(name)", color: .red)
            return nil
        }
        return index
    }
}

//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func getEntity(with id: String) -> Entity {
        if id == "boss", let boss = BOSS {
            return boss
        } else if let index = Int(id), let enemy = ENEMIES[exists: index - 1] {
            return enemy
        } else {
            return Character.entityWith(name: id)
        }
    }
    
    func updateEntity(_ entities: Entity...) {
        entities.forEach { update(entity: $0) }
    }
    
    fileprivate func update(entity: Entity) {
        let entityName = entity.name
        if entity.name == BOSS?.name {
            BOSS = entity
            if entity.currentHp < 1 {
                loot(entity: entity)
            }
        } else if entity.name == NPC?.name {
            NPC = entity
        } else if CHARACTERS.contains(where: { $0.name == entity.name }) {
            let index = Character.indexWith(name: entityName)
            guard CHARACTERS[exists: index] != nil else { return }
            CHARACTERS[index] = entity
        } else if ENEMIES.contains(where: { $0.name == entity.name }) {
            guard let index = enemyIndexWith(name: entity.name),
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
    
    func enemyIndexWith(name: String) -> Int? {
        guard let index = ENEMIES.firstIndex(where: { $0.name == name }) else {
            say("\(Utils.Strings.error): Não foi possível achar o index de \(name)", color: .red)
            return nil
        }
        return index
    }
}

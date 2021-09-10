//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func getEntity(with id: String) -> Entity {
        if id == "boss" {
            return BOSS
        } else if let index = Int(id), let enemy = ENEMIES[exists: index - 1] {
            return enemy
        } else {
            return Character.entityWith(name: id)
        }
    }
    
    func updateEntities(_ entities: Entity...) {
        for entity in entities {
            updateEntity(entity)
        }
    }
    
    func updateEntity(_ entity: Entity) {
        let entityName = entity.name.lowercased()
        if entity.name == BOSS.name {
            BOSS = entity
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
            }
        }
    }
    
    func enemyIndexWith(name: String) -> Int? {
        guard let index = ENEMIES.firstIndex(where: { $0.name == name }) else {
            say("\(Utils.Strings.error.rawValue): Não foi possível achar o index de \(name)", color: .red)
            return nil
        }
        return index
    }
}

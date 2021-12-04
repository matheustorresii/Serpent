//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func append() {
        let values = content.split(separator: " ").dropFirst()
        print(values)
        // Exists index
        guard let value0 = values[exists: 1],
              let value1 = values[exists: 2],
              let value2 = values[exists: 3],
              let value3 = values[exists: 4],
              let value4 = values[exists: 5],
              // Parsing
              let hp = Int(value1),
              let atk = Int(value2),
              let def = Int(value3),
              let spd = Int(value4) else {
            say("\(Utils.Strings.error): Erro ao adicionar novo inimigo", color: .red)
            return
        }
        let name = String(value0)
        let money = Int(values[exists: 6] ?? "0") ?? .zero
        let enemy = Entity(name: name,
                           hp: hp,
                           atk: atk,
                           exa: 0,
                           def: def,
                           spd: spd,
                           money: money)
        guard !ENEMIES.contains(where: { $0.name == enemy.name}) else {
            say("\(Utils.Strings.error): Já existe um inimigo chamado \"\(enemy.name)\"", color: .red)
            return
        }
        ENEMIES.append(enemy)
        let message = """
                    O novo inimigo \"\(name)\" foi adicionado no index \"\(ENEMIES.count)\", ele possui:
                    \(hp) de HP
                    \(atk) de Ataque
                    \(def) de Defesa
                    \(spd) de Velocidade
                    ♀︎\(money) de Drop
                    """
        say(message, color: .yellow)
    }
    
    func appendItem() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityValue = values[exists: 1],
              let nameValue = values[exists: 2],
              let effectValue = values[exists: 3],
              let sizeValue = values[exists: 4],
              let effect = Item.Effect(rawValue: "\(effectValue)"),
              let size = Item.Size(rawValue: "\(sizeValue)") else {
            say("\(Utils.Strings.error): Erro ao adicionar novo item", color: .red)
            return
        }
        
        let item = Item(name: "\(nameValue)", effect: effect, size: size)
        give(item: item, to: "\(entityValue)")
    }
    
    func give(item: Item, to entityId: String) {
        var entity = getEntity(with: "\(entityId)")
        entity.items.append(item)
        let message = "O item \(item.name) foi adicionado para \(entity.name), o item possui efeitos de \(item.effect.description) do tamanho \(item.size.description)"
        say(message, color: .yellow)
        updateEntity(entity)
    }
}

//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    // name - hp - atk - def - spd - drop
    func append() {
        let values = messageValues()
        // Exists index
        guard let name = values[exists: 0],
              let value1 = values[exists: 1],
              let value2 = values[exists: 2],
              let value3 = values[exists: 3],
              let value4 = values[exists: 4],
              // Parsing
              let hp = Int(value1),
              let atk = Int(value2),
              let def = Int(value3),
              let spd = Int(value4) else {
            return say("\(Utils.Strings.error): Erro ao adicionar novo inimigo", color: .red)
        }
        let money = Int(values[exists: 6] ?? "0") ?? .zero
        let enemy = Entity(name: "\(name)",
                           hp: hp,
                           atk: atk,
                           exa: 0,
                           def: def,
                           spd: spd,
                           money: money)
        guard !ENEMIES.contains(where: { $0.name == enemy.name}) else {
            return say("\(Utils.Strings.error): Já existe um inimigo chamado \"\(enemy.name)\"", color: .red)
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
        // id - name - effect - size
        let values = messageValues()
        guard let entityValue = values[exists: 0],
              let nameValue = values[exists: 1],
              let effectValue = values[exists: 2],
              let sizeValue = values[exists: 3],
              let effect = Item.Effect(rawValue: effectValue),
              let size = Item.Size(rawValue: sizeValue) else {
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

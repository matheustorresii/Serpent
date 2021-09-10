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
            say("\(Utils.Strings.error.rawValue): Erro ao adicionar novo inimigo", color: .red)
            return
        }
        let name = String(value0)
        let enemy = Entity(name: name,
                           hp: hp,
                           atk: atk,
                           exa: 0,
                           def: def,
                           spd: spd,
                           abilities: [])
        guard !ENEMIES.contains(where: { $0.name == enemy.name}) else {
            say("\(Utils.Strings.error.rawValue): Já existe um inimigo chamado \"\(enemy.name)\"", color: .red)
            return
        }
        ENEMIES.append(enemy)
        say("O novo inimigo \"\(name)\" foi adicionado no index \"\(ENEMIES.count)\", ele possui:" , color: .yellow)
        say("\(hp) de HP", color: .yellow)
        say("\(atk) de Ataque", color: .yellow)
        say("\(def) de Defesa", color: .yellow)
        say("\(spd) de Velocidade", color: .yellow)
        print(ENEMIES)
    }
}

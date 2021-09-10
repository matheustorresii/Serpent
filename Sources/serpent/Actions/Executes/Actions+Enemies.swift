//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func enemies() {
        if ENEMIES.isEmpty {
            say("Nenhum inimigo encontrado!", color: .yellow)
        } else {
            for (i, enemy) in ENEMIES.enumerated() {
                say("\(enemy.name) (\(i+1)) está com \(enemy.currentHp) de HP", color: .yellow)
            }
        }
    }
}

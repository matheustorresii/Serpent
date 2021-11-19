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
            return
        }
        
        ENEMIES.enumerated().forEach {
            say("\($1.name) (\($0+1)) está com \($1.currentHp) de HP", color: .yellow)
        }
    }
}

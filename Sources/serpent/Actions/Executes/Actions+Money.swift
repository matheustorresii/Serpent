//
//  File.swift
//  
//
//  Created by Matheus Torres on 18/11/21.
//

import Foundation
import Sword

extension Message {
    func money() {
        let values = content.split(separator: " ").dropFirst()
        guard let entityId = values.first,
              let lastValue = values.last,
              let value = Int(lastValue) else { return }
        
        var entity = getEntity(with: "\(entityId)")
        entity.money(value)
        say("\(entity.name) \(value < 0 ? "perdeu" : "ganhou") ♀︎\(value < 0 ? (value * -1) : value) e agora possui ♀︎\(entity.money)", color: .cyan)
        updateEntity(entity)
    }
    
    func moneyToPlayers(_ value: Int) {
        guard value > 0 else { return }
        CHARACTERS.forEach {
            var entity = getEntity(with: $0.name)
            entity.money(value)
            updateEntity(entity)
        }
        say("Todos jogadores receberam ♀︎\(value)", color: .cyan)
    }
}

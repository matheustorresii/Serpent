//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func check() {
        let values = content.split(separator: " ").dropFirst()
        if let lastValue = values.last {
            let entity = getEntity(with: "\(lastValue)")
            check(entity: entity)
        } else {
            checkSelf()
        }
    }
    
    fileprivate func checkSelf() {
        guard let character = Character(rawValue: author?.id.description ?? "") else {
            say(Utils.Strings.error.rawValue, color: .red)
            id()
            return
        }
        check(entity: character.entity, shouldShowPP: true)
    }
    
    fileprivate func check(entity: Entity, shouldShowPP: Bool = false) {
        say("\(entity.name) está com \(entity.currentHp) de HP", color: .yellow)
        if shouldShowPP {
            let message = entity.abilities.map {
                return "- \($0.name) possui \($0.pp) de pp -"
            }.joined(separator: "\n")
            say(message, color: .yellow)
        }
        if entity.protected { say("\(entity.name) está protegido!", color: .blue) }
        if entity.disabled  { say("\(entity.name) está desabilitado e não pode usar suas habilidades!", color: .orange) }
        if entity.atkBuffed { say("O ataque de \(entity.name) está aumentado!", color: .blue) }
        if entity.defBuffed { say("A defesa de \(entity.name) está aumentada!", color: .blue) }
        if entity.atkNerfed { say("O ataque de \(entity.name) está reduzido!", color: .orange) }
        if entity.defNerfed { say("A defesa de \(entity.name) está reduzida!", color: .orange) }
    }
}

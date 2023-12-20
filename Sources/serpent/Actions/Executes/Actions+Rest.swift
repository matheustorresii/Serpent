//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func rest() {
        updatePp(rest: true)
    }
    
    func unrest() {
        updatePp(rest: false)
    }
    
    fileprivate func updatePp(rest: Bool) {
        let values = messageValues()
        guard let targetId = values.first, let ability = values.last, let abilityIndex = Int(ability) else { return }
        
        let target = getEntity(with: targetId)
        
        guard let abilityUsed = target.abilities[exists: abilityIndex-1] else {
            say("\(Utils.Strings.error): Não foi possível achar essa habilidade", color: .red)
            return
        }
        
        target.abilities[abilityIndex-1].pp = abilityUsed.pp + (rest ? 1 : -1)
        say(rest
            ? "\(target.name) recuperou sua habilidade \(target.abilities[abilityIndex - 1].name) e agora possui \(target.abilities[abilityIndex - 1].pp) de pp"
            : "A habilidade \(abilityUsed.name) de \(target.name) diminuiu em 1!", color: .yellow)
        updateEntity(target)
    }
}

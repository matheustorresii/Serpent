//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    
    func doDamage(striker: Entity,
                  targetName: String,
                  basePower: Int = 0,
                  isExa: Bool = false,
                  isCrit: Bool = false,
                  isCombo: Bool = false) -> Int {
        var target = getEntity(with: targetName)
        guard !target.protected else {
            target.protected(false)
            say("\(target.name) estava protegido e não tomou dano!", color: .yellow)
            updateEntity(target)
            return 0
        }
        
        let multiplier = isCrit ? 2 : 1
        
        var damage = Utils.damage(atk: getAtk(for: striker, isExa: isExa),
                                  def: getDef(for: target), basePower: basePower)
        
        if isCombo {
            let oppositeDamage = Utils.damage(atk: getAtk(for: striker, isExa: !isExa),
                                           def: getDef(for: target), basePower: basePower)
            damage += oppositeDamage
        }
        
        let fullDamage = damage * multiplier
        
        target.currentHp(target.currentHp - fullDamage)
        
        let description = isCrit ? "crítico" : isCombo ? "de combo" : isExa ? "de extension" : "físico"
        
        say("\(striker.name) deu \(fullDamage) de dano \(description) em \(target.name)", color: .yellow)
        
        if target.currentHp < 1 {
            target.currentHp(0)
            say("\(target.name) foi derrotado", color: .red)
        }
        
        updateEntity(target)
        
        return fullDamage
    }
    
    fileprivate func getAtk(for entity: Entity, isExa: Bool = false) -> Int {
        return Int(Double(isExa ? entity.exa : entity.atk) * entity.atkStatus.multiplier)
    }
    
    fileprivate func getDef(for entity: Entity) -> Int {
        return Int(Double(entity.def) * entity.defStatus.multiplier)
    }
}

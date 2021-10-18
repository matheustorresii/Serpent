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
            say("\(target.name) foi derrotado", color: .red)
        }
        
        updateEntity(target)
        
        return fullDamage
    }
    
    fileprivate func getAtk(for entity: Entity, isExa: Bool = false) -> Int {
        if isExa {
            return entity.atkBuffed ? boost(entity.exa) : entity.atkNerfed ? decrease(entity.exa) : entity.exa
        }
        return entity.atkBuffed ? boost(entity.atk) : entity.atkNerfed ? decrease(entity.atk) : entity.atk
    }
    
    fileprivate func getDef(for entity: Entity) -> Int {
        return entity.defBuffed ? boost(entity.def) : entity.defNerfed ? decrease(entity.def) : entity.def
    }
    
    fileprivate func boost(_ value: Int) -> Int {
        return Int(Double(value) * 1.5)
    }
    
    fileprivate func decrease(_ value: Int) -> Int {
        return Int(Double(value) * 0.5)
    }
}

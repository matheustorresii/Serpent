//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    
    func doDamage(entityId: String,
                  targetId: String,
                  basePower: Int = 0,
                  isExa: Bool = false,
                  isCrit: Bool = false,
                  isCombo: Bool = false) -> (Int, Int) {
        let entity = getEntity(with: entityId)
        var target = getEntity(with: targetId)
        
        if target.buff == .protect {
            say("\(target.name) estava protegido e não tomou dano!", color: .yellow)
            return (0, 0)
        }
        
        if entity.nerf == .paralyzed, Int.random(in: 1...5) == 1 {
            say("\(entity.name) está paralizado e não conseguiu atacar", color: .orange)
            return (0, 0)
        }
        
        var damage = Utils.damage(atk: getAtk(for: entity, isExa: isExa),
                                  def: getDef(for: target), basePower: basePower)
        
        if isCombo {
            let oppositeDamage = Utils.damage(atk: getAtk(for: entity, isExa: !isExa),
                                              def: getDef(for: target), basePower: basePower)
            damage += oppositeDamage
        }
        
        let fullDamage = damage * (isCrit ? 2 : 1)
        
        target.currentHp(target.currentHp - fullDamage)
        
        let description = isCrit ? "crítico" : isCombo ? "de combo" : isExa ? "de extension" : "físico"
        
        say("\(entity.name) deu \(fullDamage) de dano \(description) em \(target.name)", color: .yellow)
        
        let entityDamage: Int = target.buff == .counter ? fullDamage/2 : .zero
        
        if target.buff == .counter {
            say("\(target.name) estava pronto para revidar e deu \(entityDamage) de dano em \(entity.name)", color: .blue)
        }
        
        defeated(entity, target)
        return (entityDamage, fullDamage)
    }
    
    fileprivate func getAtk(for entity: Entity, isExa: Bool = false) -> Int {
        return Int(Double(isExa ? entity.exa : entity.atk) * entity.atkStatus.multiplier)
    }
    
    fileprivate func getDef(for entity: Entity) -> Int {
        return Int(Double(entity.def) * entity.defStatus.multiplier)
    }
    
    fileprivate func defeated(_ entities: Entity...) {
        entities.filter { $0.currentHp < 1 }.forEach {
            say("\($0.name) foi derrotado!", color: .red)
        }
    }
}

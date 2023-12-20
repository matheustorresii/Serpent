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
                  technique: TechniqueProtocol? = nil,
                  isExa: Bool = false) -> (Entity, Entity) {
        var entity = getEntity(with: entityId)
        var target = getEntity(with: targetId)
        
        defer {
            entity.stopNerfIfNeeded()
            target.stopBuffIfNeeded()
        }
        
        if target.buff == .protect {
            say("\(target.name) estava protegido e não tomou dano!", color: .yellow)
            return (entity, target)
        }
        
        if entity.nerf == .paralyzed {
            let random = Int.random(in: 1...5)
            print(random)
            if random == 1 {
                say("\(entity.name) está paralizado e não conseguiu atacar", color: .orange)
                return (entity, target)
            }
        }
        
        let random: Int = .random(in: 1...100)
        var damage = Utils.damage(atk: getAtk(for: entity, isExa: isExa),
                                  def: getDef(for: target),
                                  basePower: technique?.power ?? 0,
                                  random: random)
        
        if technique?.attributes.contains(.combo) == true {
            let oppositeDamage = Utils.damage(atk: getAtk(for: entity, isExa: !isExa),
                                              def: getDef(for: target),
                                              basePower: technique?.power ?? 0,
                                              random: random)
            damage += oppositeDamage
        }
        
        entity.ultimate?.addCharge(random)
        
        let targetDamage = damage * (technique?.attributes.contains(.critical) == true ? 2 : 1)
        
        let description = isExa || (technique?.attributes.contains(.physical) == false) ? "de extension" : "físico"
        
        say("\(entity.name) deu \(targetDamage) de dano \(description) em \(target.name)", color: .yellow)
        
        let entityDamage: Int = target.buff == .counter ? targetDamage/2 : .zero
        
        if target.buff == .counter {
            say("\(target.name) estava pronto para revidar e deu \(entityDamage) de dano em \(entity.name)", color: .blue)
        }
        
        entity.subHp(entityDamage)
        target.subHp(targetDamage)
        
        if technique?.attributes.contains(.drain) == true {
            let newHp = heal(entityId: entityId, with: targetDamage/2)
            entity.currentHp(newHp)
            say("\(entity.name) drenou \(target.name)!", color: .yellow)
        }
        
        defeated(entity, target)
        return (entity, target)
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

//
//  File.swift
//  
//
//  Created by Matheus Torres on 17/07/22.
//

import Sword

extension Message {
    func ult() {
        let character = character()
        ult(entityId: character.name,
            ultimate: character.ultimate)
    }
    
    func bossUlt() {
        ult(entityId: Utils.Strings.bossId,
            ultimate: BOSS?.ultimate)
    }
    
    private func ult(entityId: String, ultimate: UltimateProtocol?) {
        guard let ultimate = ultimate else {
            return say("\(entityId) não possui uma ultimate!", color: .red)
        }
        guard let targetId = messageValues().first else { return }
        doTechnique(entityId: entityId,
                  targetId: targetId,
                  technique: ultimate)
        
    }
}

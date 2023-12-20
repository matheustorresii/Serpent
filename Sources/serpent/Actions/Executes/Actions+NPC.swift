//
//  File.swift
//  
//
//  Created by Matheus Torres on 23/03/22.
//

import Foundation
import Sword

extension Message {
    func npc() {
        let values = messageValues()
        guard let npcName = values.last else { return }
        guard let newNpc = Npcs(rawValue: npcName) else {
            return say("\(Utils.Strings.error): Este NPC não está registrado!", color: .red)
        }
        say("\(NPC?.name ?? "") foi substituído por \(newNpc.entity?.name ?? "")!", color: .yellow)
        NPC = newNpc.entity
    }
}

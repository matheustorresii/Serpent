//
//  File.swift
//  
//
//  Created by Matheus Torres on 23/03/22.
//

import Foundation
import Sword

extension Message {
    func setNpc() {
        let values = content.split(separator: " ").dropFirst()
        guard let npcName = values.last else { return }
        guard let newNpc = Npcs(rawValue: "\(npcName)") else {
            return say("\(Utils.Strings.error): Este NPC não está registrado!", color: .red)
        }
        say("\(NPC?.name ?? "null") foi substituído por \(newNpc.entity?.name ?? "null")!", color: .yellow)
        NPC = newNpc.entity
    }
}

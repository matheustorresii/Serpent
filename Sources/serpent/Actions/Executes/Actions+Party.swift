//
//  File.swift
//  
//
//  Created by Matheus Torres on 22/04/22.
//

import Foundation
import Sword

enum Party: String {
    case null
    case rebels
    case kingdoms
    
    var characters: [Entity] {
        return CHARACTERS
//        switch self {
//        case .null:     return []
//        case .rebels:   return REBELS
//        case .kingdoms: return KINGDOMS
//        }
    }
}

extension Message {
    func party() {
        let values = content.split(separator: " ").dropFirst()
        guard let value = values.last else { return }
        guard let party = Party(rawValue: "\(value)") else {
            return say("\(Utils.Strings.error): Party não registrada", color: .red)
        }
        say("Agora o grupo de jogadores faz parte dos \(party.rawValue.capitalized)", color: .yellow)
        CHARACTERS = party.characters
    }
}

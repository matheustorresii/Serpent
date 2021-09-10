//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func random() {
        let values = content.split(separator: " ").dropFirst()
        guard let first = values.first, let last = values.last,
              let min = Int(first), let max = Int(last),
              min < max else { return }
        guard let character = Character(rawValue: author?.id.description ?? "") else {
            say(Utils.Strings.error.rawValue, color: .red)
            id()
            return
        }
        let random = Int.random(in: min...max)
        say("\(character.entity.name) rolou o número \(random)", color: .yellow)
    }
}

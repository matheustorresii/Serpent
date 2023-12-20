//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func random() {
        let values = messageValues()
        guard let first = values.first, let last = values.last,
              let min = Int(first), let max = Int(last),
              min < max else { return }
        let random = Int.random(in: min...max)
        say("\(character().name) rolou o número \(random)", color: .yellow)
    }
}

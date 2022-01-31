//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

struct Utils {
    static func damage(atk: Int, def: Int, basePower: Int = 0) -> Int {
        let random = Int.random(in: 1...100)
        let damage = (atk * (random + basePower) - def) / 200
        print("atk: \(atk) - def: \(def) - rdm: \(random) - dmg: \(damage)")
        if damage < 1 { return 1 }
        return random >= 95 ? damage * 2 : damage
    }
}

// MARK: - STRINGS

extension Utils {
    struct Strings {
        static let error = "[Error 😵]"
        static let bossId = "boss"
    }
}

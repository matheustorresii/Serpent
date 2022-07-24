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
        let damage = (atk * (random + (basePower * 10)) - def) / 200
        let multiplier = random >= 90 ? 2 : 1
        print("atk: \(atk) - def: \(def) - rdm: \(random) - dmg: \(damage)")
        return max(damage * multiplier, 1)
    }
}

// MARK: - STRINGS

extension Utils {
    struct Strings {
        static let error = "[Error 😵]"
        static let bossId = "boss"
    }
    
    struct Numbers {
        static let charge: Int = 1000
    }
}

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
        let multiplier = random >= 95 ? 2 : 1
        print("atk: \(atk) - def: \(def) - rdm: \(random) - dmg: \(damage)")
        return max(damage * multiplier, 1)
    }
    
    static func emoji(for number: Int) -> String {
        switch number {
        case 1: return "1️⃣"
        case 2: return "2️⃣"
        case 3: return "3️⃣"
        case 4: return "4️⃣"
        case 5: return "5️⃣"
        case 6: return "6️⃣"
        case 7: return "7️⃣"
        case 8: return "8️⃣"
        case 9: return "9️⃣"
        default:return "0️⃣"
        }
    }
}

// MARK: - STRINGS

extension Utils {
    struct Strings {
        static let error = "[Error 😵]"
        static let bossId = "boss"
    }
}

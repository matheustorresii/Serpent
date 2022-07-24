//
//  Ability.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Foundation

struct Ability {
    let name: String
    let power: Int
    var pp: Int
    let attributes: [Attributes]
    
    mutating func pp(_ value: Int) {
        pp = value
    }
}

//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func damage() {
        let values = content.split(separator: " ").dropFirst()
        guard let firstValue = values.first, let lastValue = values.last else { return }
        
        let first = String(firstValue)
        let targetName = String(lastValue)
        
        let striker = getEntity(with: first)
        
        doDamage(striker: striker, targetName: targetName)
    }
}

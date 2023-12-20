//
//  File.swift
//  
//
//  Created by Matheus Torres on 24/07/22.
//

import Foundation
import Sword

extension Message {
    func messageValues() -> [String] {
        return self.content.split(separator: " ").dropFirst().map { "\($0)" }
    }
    
    func character() -> Entity {
        Entity.getEntityWith(id: author?.id.description)
    }
}

//
//  File.swift
//  
//
//  Created by Matheus Torres on 31/01/22.
//

import Foundation
import Sword

extension Message {
    func battle() {
        Queue.shared.start(message: self)
    }
}

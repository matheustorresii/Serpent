//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func id() {
        let username = author?.username ?? Utils.Strings.error.rawValue
        let userId = author?.id.description ?? Utils.Strings.error.rawValue
        say("O ID de \(username) é \(userId)", color: .blue)
    }
}

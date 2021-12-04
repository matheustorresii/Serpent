//
//  File.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func id() {
        let username = author?.username ?? Utils.Strings.error
        let userId = author?.id.description ?? Utils.Strings.error
        say("O ID de \(username) é \(userId)", color: .blue)
    }
    
    func idError() {
        say(Utils.Strings.error, color: .red)
        id()
    }
}

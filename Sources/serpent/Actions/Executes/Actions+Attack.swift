//
//  File.swift
//  
//
//  Created by Matheus Torres on 06/09/21.
//

import Sword

extension Message {
    func attack() {
        let values = content.split(separator: " ").dropFirst()
        guard let targetName = values.first else { return }
        guard let character = Character(rawValue: author?.id.description ?? "") else {
            say(Utils.Strings.error.rawValue, color: .red)
            id()
            return
        }
        doDamage(striker: character.entity, targetName: "\(targetName)", basePower: 0, isExa: false)
    }
}

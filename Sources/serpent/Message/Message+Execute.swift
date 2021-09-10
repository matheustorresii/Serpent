//
//  Message+Execute.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    func execute() {
        guard let firstArgument = content.dropFirst().split(separator: " ").first,
              let action = Actions(rawValue: "\(firstArgument)") else { return }
        action.execute(self)
    }
}

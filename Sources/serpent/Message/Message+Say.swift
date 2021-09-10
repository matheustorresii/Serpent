//
//  Message+Extensions.swift
//  
//
//  Created by Matheus Torres on 05/09/21.
//

import Sword

extension Message {
    enum MessageColor {
        case blue
        case cyan
        case green
        case yellow
        case orange
        case red
        case none
    }
    
    func say(_ string: String, color: MessageColor) {
        switch color {
            case .blue: sayBlue(string)
            case .cyan: sayCyan(string)
            case .green: sayGreen(string)
            case .yellow: sayYellow(string)
            case .orange: sayOrange(string)
            case .red: sayRed(string)
            case .none: sayClear(string)
        }
    }
    
    private func sayBlue(_ string: String) {
        self.reply(with: "```ini\n[\(string)]\n```")
    }
    
    private func sayCyan(_ string: String) {
        self.reply(with: "```py\n'\(string)'\n```")
    }
    
    private func sayGreen(_ string: String) {
        self.reply(with: "```diff\n+ \(string) +\n```")
    }
    
    private func sayYellow(_ string: String) {
        self.reply(with: "```fix\n\(string)\n```")
    }
    
    private func sayOrange(_ string: String) {
        self.reply(with: "```css\n[\(string)]\n```")
    }
    
    private func sayRed(_ string: String) {
        self.reply(with: "```diff\n- \(string) -\n```")
    }
    
    private func sayClear(_ string: String) {
        self.reply(with: string)
    }
    
}

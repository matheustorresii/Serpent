//
//  File.swift
//  
//
//  Created by Matheus Torres on 31/01/22.
//

import Foundation
import Sword

class Queue {
    
    // MARK: - SINGLETON
    
    static let shared: Queue = .init()
    
    // MARK: - PRIVATE PROPERTIES
    
    private var entities = [Entity]()
    private var index: Int = .zero
    private var phase: Phase = .target
    
    // MARK: - INITIALIZERS
    
    private init() { }
    
    // MARK: - PUBLIC METHODS
    
    func start(message: Message) {
        let queue = (CHARACTERS.players + ENEMIES + [BOSS]).compactMap { $0 }
        self.entities = queue.sorted { $0.spd > $1.spd }
        begin(message)
    }
    
    func nextPhase(chose: String) {
        
    }
    
    // MARK: - PRIVATE METHODS
    
    private func begin(_ message: Message) {
        guard let entity = entities[exists: index] else { return }
        let color = CHARACTERS.players.contains { $0.name == entity.name } ? Queue.Constants.teamColor : Queue.Constants.enemyColor
        message.say(name: entity.name,
                    description: phase.description,
                    color: color,
                    reactions: phase.reactions)
    }
}

extension Message {
    fileprivate func say(name: String, description: String, color: Int, reactions: [String]) {
        var embed = Embed()
        embed.description = description
        embed.author = .init(iconUrl:
                                "https://cdn.discordapp.com/avatars/243371249215078400/57788d4049198122e0fa8330bdf6113a.webp?size=160",
                             name: name,
                             url: nil)
        self.reply(with: embed) { message, _ in
            reactions.forEach {
                message?.addReaction($0, then: nil)
            }
        }
    }
}

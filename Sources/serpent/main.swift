import Sword
import Foundation

let bot = Sword(token: TOKEN)

bot.editStatus(to: "online", playing: "Episode 2")

bot.on(.messageCreate) { data in
    guard let msg = data as? Message, msg.content.starts(with: "!") else { return }
    msg.execute()
    guard let snowFlake = msg.channel.sword?.guilds.first?.key else { return }
    bot.getMembers(from: snowFlake) { member, error in
        print(member)
        print(error)
    }
}

bot.connect()

import Sword
import Foundation

let bot = Sword(token: TOKEN)

bot.editStatus(to: "online", playing: "Episode 3")

bot.on(.messageCreate) { data in
    guard let msg = data as? Message, msg.content.starts(with: "!") else { return }
    msg.execute()
}

bot.connect()

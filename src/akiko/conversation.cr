require "./chatline"
require "log"

module Akiko
  class Conversation
    def initialize(game, engine, xhr, version, challenge_queue)
    end

    COMMAND_PREFIX = "!"

    def react(line : ChatLine)
      Log.info &.emit "#{game.url} - #{line.room} :: #{line.username} #{line.text.encode("utf-8")}"
      if line.text[0] == self.COMMAND_PREFIX
        command(line, game, line.text[1].to_lower)
      end
    end

    def send_reply(line : ChatLine, reply : String)
      Log.info &.emit { "*** #{self.game.url} [#{line.room}] #{self.game.username}: #{reply}" }
      self.xhr.chat(self.game.id, line.room, reply)
    end

    private def command(line : ChatLine, game, cmd : String)
      from_self = line.username == @@game.username
      case cmd
      when "commands" || "help"
        Log.info &.emit { "Supported commands: !wait (wait a minute for my first move), !name, !howto, !eval, !queue" }
      when "wait" && game.is_aborted
        game.ping(60, 120, 120)
        self.send_reply(line, "Waiting 60 seconds...")
      when "name"
        self.send_reply(line, "Waiting 60 seconds...")
        self.xhr.chat(@@game.id, line.room, reply)
      end
    end
  end
end

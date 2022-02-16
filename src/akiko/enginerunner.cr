require "http/client"
require "json"
require "colorize"

module Akiko

  class Start
    SERVER = "lichess.org/api/account"
    # This function should authorize the bot & automatically upgrade it to a bot account.
    # Smol feature but I think it's still cool.
    # Takes *token* as an argument.
    def authorize_bot(token : String)
      reqtoken = "Bearer #{token}"
      HTTP::Client.get("https://#{SERVER}", HTTP::Headers{"Authorization" => reqtoken}) do |res|
        res.status_code == "200" ? p res.status_code.colorize(:green).mode(:bold) : p res.status_code.colorize(:red).mode(:bold)
        p res.body_io.gets.colorize.back(:black).fore(:magenta)
      end
    end

    # We're only doing UCI compatability for now
    def create_engine(name : String, binary : String)
      cmd = "./engines/#{name}/#{binary}"
      Process.exec("sh", {"-c", cmd})
    end
  end

  v = Start.new
  v.create_engine("ctengine-rs", "target/release/ctengine")
end

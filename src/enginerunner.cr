require "http/client"
require "json"
require "colorize"

module Akiko
  SERVER = "lichess.org/api/account"

  class Start
    def authorize_bot(token : String)
      reqtoken = "Bearer #{token}"
      HTTP::Client.get("https://#{SERVER}", HTTP::Headers{"Authorization" => reqtoken}) do |res|
        res.status_code == "200" ? p res.status_code.colorize(:green).mode(:bold) : p res.status_code.colorize(:red).mode(:bold)
        p res.body_io.gets.colorize.back(:black).fore(:magenta)
      end
    end

    def engine(name : String, binary : String)
      cmd = "./#{name}/#{binary}"
      Process.exec("sh", {"-c", command}, output: io)
    end
  end

  v = Start.new
  v.engine("ctengine-rs", "/target/release/ctengine")
end

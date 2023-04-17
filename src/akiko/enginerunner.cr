require "http/client"
require "json"
require "colorize"

module Akiko
  # Every single new engine from the config should have the properties of *token*,
  # *binary* and *name* at the very least.
  abstract struct EngineTemplate
    enum RunStatus
      Halted  # => 0
      Running # => 1
    end

    def initialize(@@name : String)
      @@binary : String
      @@token : Token
      @@channel : Channel(Int16)
    end

    private abstract def run
    abstract def restart
    abstract def halt
  end

  class Engine < EngineTemplate
    # This function should authorize the bot with the provided *token* & automatically upgrade it to a bot account.
    # Smol feature but I think it's still cool.
    def authorize_engine
      reqtoken = "Bearer #{@@token}"
      HTTP::Client.get("#{SERVER}/api/account", HTTP::Headers{"Authorization" => reqtoken}) do |res|
        res.status_code == "200" ? p res.status_code.colorize(:green).mode(:bold) : p res.status_code.colorize(:red).mode(:bold)
        p res.body_io.gets.colorize.back(:black).fore(:magenta)
      end
    end

    # We're only doing UCI compatability for now
    private def run(@@name : String, @@binary : String)
      cmd = "./engines/#{name}/#{binary}"
      {% if flag?(:linux) %}
        # Linux
        spawn Process.exec("sh", {"-c", cmd})
      {% elsif flag?(:darwin) %}
        # Mac
        spawn Process.exec("sh", {"-c", cmd})
      {% elsif flag?(:win32) %}
        # Windows
        spawn Process.exec({cmd})
      {% end %}
      channel.send(1)
    end

    def restart
      Fiber.yield
    end

    def halt
      Fiber.yield
    end
  end

  v = Start.new
  v.create_engine("ctengine-rs", "target/release/ctengine")
end

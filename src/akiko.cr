# TODO: Write documentation for `Akiko`

require "http/client"
require "json"
require "colorizer"

module Akiko
  VERSION = "0.1.0"
  CONFIG  = "../config.yml"
  SERVER  = "https://lichess.org"

  # Alias the most important things to us rn
  alias Token = String
  alias Engine = String
  alias Binary = String

  # For useful error annotations later on.
  annotation Error
  end

  # We want to turn all `Event` instances into json so we can easily handle responses
  # from the lichess server.
  # Bear in mind that this means we'll be working with *#to_json* methods all the time now.
  abstract struct Event
    include JSON::Serializable

    use_json_discriminator "type", {
      "ServerConnection": ServerConnection,
      "EngineMove":       EngineMove,
    }
  end

  abstract struct EngineTemplate
    def initialize(@name : Engine)
      @binary : String
      @token : Token
    end
  end

  struct ServerConnection < Event
    getter engine

    def initialize(@engine : Engine)
    end
  end

  struct EngineMove < Event
    getter engine, piece

    def initialize(@engine : Engine, @move : String)
    end
  end

  class Akiko
    def __main__
      e0 = ServerConnection.new("0.0.0.0")
      e1 = EngineMove.new("0.0.0.0", "e2e4")
      p e0.to_json
      p e1.to_json
    end
  end

  main = Akiko.new
  main.__main__
end

# TODO: Write documentation for `Akiko`

require "http/client"
require "json"
require "colorize"

require "./akiko"

module Akiko
  VERSION = "0.1.0"
  CONFIG  = "../config.yml"
  SERVER  = "https://lichess.org"

  # Alias the most important things to us rn
  alias Token = String
  alias Engine = String
  alias Binary = String

  # For useful error annotations later on.
  annotation NetError
  end

  # What we want for the default results of our API callbacks
  annotation APICallback
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

  # Every single new engine from the config should have the properties of *token*,
  # *binary* and *name* at the very least.
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

  # Alias all the engine moves to a struct; each move is an instance of this struct with
  # specific properties that we use in the HTTP request to lichess.
  struct EngineMove < Event
    getter engine, piece

    def initialize(@engine : Engine, @move : String)
    end
  end

  @[APICallback(value: 200, name: "Success")]
  class Akiko
    def __main__
      e0 = ServerConnection.new("0.0.0.0")
      e1 = EngineMove.new("0.0.0.0", "e2e4")
      p e0.to_json
      p e1.to_json
    end
  end

  akiko = Akiko.new
  akiko.__main__
end

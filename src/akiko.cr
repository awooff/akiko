# TODO: Write documentation for `Akiko`

require "lichess-cr"
require "http/client"
require "json"
require "colorize"

require "./akiko"

module Akiko
  VERSION = "0.1.0"
  CONFIG  = "../config.yml"
  SERVER  = "https://lichess.org"

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

  struct ServerConnection < Event
    getter engine

    def initialize(@@engine : String)
    end
  end

  # Alias all the engine moves to a struct; each move is an instance of this struct with
  # specific properties that we use in the HTTP request to lichess.
  struct EngineMove < Event
    getter engine, piece

    def initialize(@@engine : String, @move : String)
    end
  end

  e0 = ServerConnection.new("0.0.0.0")
  e1 = EngineMove.new("0.0.0.0", "e2e4")
  p e0.to_json
  p e1.to_json
end

require "http/client"
require "json"
require "colorize"
require "./config"

module Akiko
  <<-DOC
    Every single new engine from the config should have the properties of *token*,
    *binary* and *name* at the very least.
  DOC

  abstract class EngineTemplate
    enum RunStatus
      Halted  # => 0
      Running # => 1
    end

    def initialize(@@name : String)
      binary : String
      token : String
      channel : Channel(Int16)
    end
  end

  class Engine < EngineTemplate
    # This function should authorize the bot with the provided *token* & automatically upgrade it to a bot account.
    # Smol feature but I think it's still cool.
    def authorize_engine
      request_token = "Bearer #{@@token}"
      HTTP::Client.get("#{SERVER}/api/account", HTTP::Headers{"Authorization" => request_token}) do |response|
        response.status_code == "200" ? puts response.status_code.colorize(:green).mode(:bold) : puts response.status_code.colorize(:red).mode(:bold)
        puts response.body_io.gets.colorize.back(:black).fore(:magenta)
      end
    end

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

    # ~Thanks ChatGPT~
    def create_connection
      socket = TCPSocket.new(SERVER + "/api", 443)

      # Initialize UCI protocol
      socket.puts("uci")

      # Start new game
      socket.puts("ucinewgame")

      # Set up starting position
      socket.puts("position startpos moves")
      response = socket.gets

      # Generate a pawn move
      move = "e2e4"

      # Send move to server
      socket.puts("position startpos moves #{move}")
      socket.puts("go")
      while response = socket.gets
        if response.starts_with?("info") && response.include?("bestmove")
          # Extract the best move from the response
          best_move = response.split(" ").find(&.starts_with?("bestmove")).split(" ")[1]

          # Validate that the best move matches the move sent by the bot
          if best_move == move
            puts "Correct move!"
          else
            puts "Incorrect move: #{best_move}"
          end

          break
        end
      end
    end

    # We're only doing UCI compatability for now
    def run(@@engine : String, @@binary : String)
      cmd = "./engines/#{engine}/#{binary}"
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
    end

    def restart
      Fiber.yield
    end

    def halt
      Fiber.yield
    end
  end
end

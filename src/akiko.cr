#
#   Akiko
#   -----------
#   Akiko is a multi-engine bot runner for lichess.
#   Its spec requires it to do the following:
#   - Validate engine moves
#   - Spawn multiple bot instances
#   - Manage their connections to Lichess
#   - Allow bots to play games with humans
#   - Accept new games
#   - Provide stats about their win/loss rate in a graph
#

require "http/client"
require "json"
require "colorize"
require "log"
require "envyable"

require "./akiko/**"

module Akiko
  VERSION = "0.1.5"
  SERVER  = "https://lichess.org/api"

  config = Akiko::Config.new

  # Main
  Log.info { "Akiko version :: #{VERSION}" }
  Log.info { config }
end

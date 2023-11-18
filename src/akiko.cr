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

require "./akiko/**"

module Akiko
  VERSION = "0.1.0"
  CONFIG  = "../config.yml"
  SERVER  = "https://lichess.org"

  config = Akiko::Config.new
  engines = config.read

  puts engines
end

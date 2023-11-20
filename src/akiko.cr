# TODO: Write documentation for `Akiko`

require "http/client"
require "json"
require "colorize"
require "log"
require "envyable"

require "./akiko/**"

module Akiko
  VERSION = "0.1.5"
  SERVER  = "https://lichess.org"

  config = Akiko::Config.new

  # Main
  Log.info { "Akiko version :: #{VERSION}" }
  Log.info { config }
end

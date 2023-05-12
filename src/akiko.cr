# TODO: Write documentation for `Akiko`

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

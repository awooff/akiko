require "envyable"

module Akiko
  enum Mode
    Development # => 0
    Production  # => 1
    Testing     # => 2
  end

  class Config
    def initialize
      @mode = ENV["EXEC_ENV"]
      config = Envyable.load("./config.yml", "development").to_json
      config
    end
  end
end

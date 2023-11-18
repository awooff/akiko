require "envyable"

module Akiko
  class Config
    def read
      Envyable.load("../../config.yml", "development")
    end
  end
end

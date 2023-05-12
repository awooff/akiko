require "envyable"

module Akiko
  def read
    Envyable.load("../../config.yml", "development")
  end
end

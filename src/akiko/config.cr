require "yaml"

class Config
  include YAML::Serializable

  def initialize(file)
  end

  yaml = YAML.parse(File.read("./config.yml"))
  yaml.class
  hash = yaml.as_h
  hash.class
  yaml["name"].as_a.first
  yaml["binary"].as_s
  yaml["token"].as_s
end

p Config.from_yaml("../../config.yml")

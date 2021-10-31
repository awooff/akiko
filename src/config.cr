require "yaml"

class Config
  include YAML::Serializable
  yaml = File.open("../config.yml") { |file| YAML.parse(file) }
  yaml.class
  hash = yaml.as_h
  hash.class
  yaml["name"].as_a.first
  yaml["binary"].as_s
  yaml["token"].as_s
end

p Config.from_yaml(yaml)

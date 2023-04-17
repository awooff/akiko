module Akiko
  class ChatLine
    def initialize(json : Hash(String, String))
      @@room = json["room"]
      @@username = json["username"]
      @@text = json["text"]
    end
  end
end

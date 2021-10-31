module Akiko
  class Challenger
    def initialize(info)
      @challenger : String = info.challenger.get("challenger")
      @challengername : String = info.challenger.get("title") ? @challenger : None
    end
  end
end

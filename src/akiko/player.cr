# Handle all requests for games.
module Akiko
  class UserChallenge
    def initialize(info)
      @id : String = info.id
      @rated : String = info.rated
      @variant : String = info.variant.key
    end
  end
end

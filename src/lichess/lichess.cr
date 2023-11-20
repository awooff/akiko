require "../board/constants"

module Lichess
  class StreamEvent
    def gameStart(gameId : String, fullId : String, color : Color)
    end
  end
end

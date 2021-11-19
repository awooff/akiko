# Let's define the end of games
module Akiko
  class Termination
    MATE    = "mate"
    TIMEOUT = "timeout"
    RESIGN  = "resign"
    DRAW    = "draw"
    ABORT   = "abort"
  end

  # And what that looks like to lichess
  class GameEnd
    WHITE_VICTORY = "1-0"
    BLACK_VICTORY = "0-1"
    DRAW          = "1/2-1/2"
    NA            = "*"
  end
end

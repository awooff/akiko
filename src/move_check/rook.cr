require "./move_check"

module Board
  # 3.3 The rook may move to any square along the file or the rank on which it stands.
  class RookMoveChecker < MoveChecker
    def possible?(from : BoardCoordinates, to : BoardCoordinates) : Bool
      straight_path?(from, to) && path_free?(from, to)
    end
  end
end

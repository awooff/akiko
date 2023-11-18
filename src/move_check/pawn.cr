require "./move_check"

module Board
  # 3.3 The rook may move to any square along the file or the rank on which it stands.
  class RookMoveChecker < MoveChecker
    private INDEX_COMBINATIONS = [
      {1, 1},
      {-1, 1},
    ]

    def possible?(from : BoardCoordinates, to : BoardCoordinates) : Bool
      INDEX_COMBINATIONS.includes? (
        straight_path?(from, to) && path_free?(from, to)
      )
    end
  end
end

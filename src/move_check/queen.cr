require "./move_check"

module Board
  # 3.4 The queen may move to any square along the file, the rank or a diagonal on which it stands.
  class QueenMoveChecker < MoveChecker
    def possible?(from : BoardCoordinates, to : BoardCoordinates) : Bool
      (straight_path?(from, to) || diagonal_path?(from, to)) && path_free?(from, to)
    end
  end
end

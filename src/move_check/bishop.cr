require "./move_check"

module Board
  # 3.2 The bishop may move to any square along a diagonal on which it stands.
  class BishopMoveChecker < MoveChecker
    def possible?(from : BoardCoordinates, to : BoardCoordinates) : Bool
      diagonal_path?(from, to) && path_free?(from, to)
    end
  end
end

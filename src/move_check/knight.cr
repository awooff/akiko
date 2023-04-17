require "./move_check"

module Board
  # 3.6 The knight may move to one of the squares nearest to that on which it stands but not on the same rank, file or diagonal.
  class KnightMoveChecker < MoveChecker
    private INDEX_COMBINATIONS = [
      {1, 2},
      {1, -2},
      {-1, 2},
      {-1, -2},
      {2, 1},
      {-2, 1},
      {2, -1},
      {-2, -1},
    ]

    def possible?(from : BoardCoordinates, to : BoardCoordinates) : Bool
      INDEX_COMBINATIONS.includes?(
        {from.file_index - to.file_index, from.rank_index - to.rank_index}
      )
    end
  end
end

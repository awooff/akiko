require "../board/board"
require "../board/coordinates"

module Board
  abstract class MoveChecker
    def initialize(board : Board)
      @board = board
    end

    abstract def possible?(from : BoardCoordinates, to : BoardCoordinates) : Bool

    protected def diagonal_path?(from : BoardCoordinates, to : BoardCoordinates) : Bool
      file_difference = from.file_index - to.file_index
      rank_difference = from.rank_index - to.rank_index

      file_difference.abs == rank_difference.abs
    end

    private def straight_path?(from : BoardCoordinates, to : BoardCoordinates) : Bool
      from.file_index == to.file_index || from.rank_index == to.rank_index
    end

    protected def path_free?(from : BoardCoordinates, to : BoardCoordinates) : Bool
      files = from.file_index.to(to.file_index).to_a
      ranks = from.rank_index.to(to.rank_index).to_a

      # It's possible that we stay on one file/rank, therefore the corresponding array will
      # only contain one entry. In that case we need to expand it to the length of the other
      # dimension, so they zip together properly.
      if files.size == 1
        files = files * ranks.size
      elsif ranks.size == 1
        ranks = ranks * files.size
      end

      # We skip 1 because that's the source piece position
      files.zip(ranks).skip(1).none? do |file_index, rank_index|
        @board.piece_at_index?(file_index, rank_index)
      end
    end
  end
end

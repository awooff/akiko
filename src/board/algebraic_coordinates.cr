require "../board/coordinates"

module Board
  class AlgebraicCoordinates
    def initialize(coordinates : String)
      raise ArgumentError.new if coordinates.size != 2

      @file = coordinates[0].as(Char)
      @rank = coordinates[1].to_i.as(Int32)
    end

    def to_board_coordinates
      @board_coordinates ||= BoardCoordinates.new(file_index, rank_index)
    end

    private def file_index : Int
      @file.ord - 'a'.ord
    end

    private def rank_index : Int
      @rank - 1
    end
  end
end

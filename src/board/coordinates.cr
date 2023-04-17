module Board
  class BoardCoordinates
    def initialize(file_index : Int32, rank_index : Int32)
      @file_index = file_index
      @rank_index = rank_index
    end

    getter :file_index, :rank_index

    def valid?
      (0..7).includes?(file_index) && (0..7).includes?(rank_index)
    end

    def ==(other : BoardCoordinates)
      self.file_index == other.file_index &&
        self.rank_index == other.rank_index
    end
  end
end

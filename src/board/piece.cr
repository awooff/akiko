require "./constants"
require "./figurine_algebraic_notation"

module Board
  class ChessPiece
    private def initialize(colour : Colour, piece : Piece)
      @colour = colour
      @piece = piece
    end

    getter :colour, :piece

    def self.new_white(piece : Piece)
      new(WHITE, piece)
    end

    def self.new_black(piece : Piece)
      new(BLACK, piece)
    end

    def white?
      @colour == WHITE
    end

    def black?
      @colour == BLACK
    end

    def to_s(io : IO)
      io << FigurineAlgebraicNotation[self]
    end

    def ==(other : ChessPiece?)
      return false if other.nil?

      self.colour == other.colour &&
        self.piece == other.piece
    end
  end
end

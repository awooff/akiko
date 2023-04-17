module Board
  VERSION = "0.1.0"

  KING   = Piece::King
  QUEEN  = Piece::Queen
  ROOK   = Piece::Rook
  BISHOP = Piece::Bishop
  KNIGHT = Piece::Knight
  PAWN   = Piece::Pawn

  WHITE = Colour::White
  BLACK = Colour::Black

  enum Colour
    White
    Black
  end

  enum Piece
    King
    Queen
    Rook
    Bishop
    Knight
    Pawn
  end
end

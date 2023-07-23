require "./piece"

class FigurineAlgebraicNotation
  private WHITE_FIGURINES = {
    KING   => '♔',
    QUEEN  => '♕',
    ROOK   => '♖',
    BISHOP => '♗',
    KNIGHT => '♘',
    PAWN   => '♙',
  }

  private BLACK_FIGURINES = {
    KING   => '♚',
    QUEEN  => '♛',
    ROOK   => '♜',
    BISHOP => '♝',
    KNIGHT => '♞',
    PAWN   => '♟',
  }

  def self.[](chess_piece : ChessPiece)
    if chess_piece.white?
      WHITE_FIGURINES[chess_piece.piece]
    else
      BLACK_FIGURINES[chess_piece.piece]
    end
  end
end

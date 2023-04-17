require "./piece"
require "./board"
require "./constants.cr"
require "./algebraic_coordinates"

module Chess
  class BoardBuilder
    def self.empty
      Board.new
    end

    def self.initial_board
      empty.tap do |board|
        # white base rank
        board[AlgebraicCoordinates.new("a1")] = ChessPiece.new_white(ROOK)
        board[AlgebraicCoordinates.new("b1")] = ChessPiece.new_white(KNIGHT)
        board[AlgebraicCoordinates.new("c1")] = ChessPiece.new_white(BISHOP)
        board[AlgebraicCoordinates.new("d1")] = ChessPiece.new_white(QUEEN)
        board[AlgebraicCoordinates.new("e1")] = ChessPiece.new_white(KING)
        board[AlgebraicCoordinates.new("f1")] = ChessPiece.new_white(BISHOP)
        board[AlgebraicCoordinates.new("g1")] = ChessPiece.new_white(KNIGHT)
        board[AlgebraicCoordinates.new("h1")] = ChessPiece.new_white(ROOK)

        # white pawn rank
        ('a'..'h').each do |file|
          board[AlgebraicCoordinates.new("#{file}2")] = ChessPiece.new_white(PAWN)
        end

        # black base rank
        board[AlgebraicCoordinates.new("a8")] = ChessPiece.new_black(ROOK)
        board[AlgebraicCoordinates.new("b8")] = ChessPiece.new_black(KNIGHT)
        board[AlgebraicCoordinates.new("c8")] = ChessPiece.new_black(BISHOP)
        board[AlgebraicCoordinates.new("d8")] = ChessPiece.new_black(QUEEN)
        board[AlgebraicCoordinates.new("e8")] = ChessPiece.new_black(KING)
        board[AlgebraicCoordinates.new("f8")] = ChessPiece.new_black(BISHOP)
        board[AlgebraicCoordinates.new("g8")] = ChessPiece.new_black(KNIGHT)
        board[AlgebraicCoordinates.new("h8")] = ChessPiece.new_black(ROOK)

        # black pawn rank
        ('a'..'h').each do |file|
          board[AlgebraicCoordinates.new("#{file}7")] = ChessPiece.new_black(PAWN)
        end
      end
    end
  end
end

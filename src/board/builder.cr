require "./piece"
require "./board"
require "./constants.cr"
require "./algebraic_coordinates"

module Chess
  class BoardBuilder
    def self.empty?
      Board::Board.new
    end

    def self.initial_board
      empty?.tap do |board|
        # white base rank
        board[Board::AlgebraicCoordinates.new("a1")] = ChessPiece.new_white(ROOK)
        board[Board::AlgebraicCoordinates.new("b1")] = ChessPiece.new_white(KNIGHT)
        board[Board::AlgebraicCoordinates.new("c1")] = ChessPiece.new_white(BISHOP)
        board[Board::AlgebraicCoordinates.new("d1")] = ChessPiece.new_white(QUEEN)
        board[Board::AlgebraicCoordinates.new("e1")] = ChessPiece.new_white(KING)
        board[Board::AlgebraicCoordinates.new("f1")] = ChessPiece.new_white(BISHOP)
        board[Board::AlgebraicCoordinates.new("g1")] = ChessPiece.new_white(KNIGHT)
        board[Board::AlgebraicCoordinates.new("h1")] = ChessPiece.new_white(ROOK)

        # white pawn rank
        ('a'..'h').each do |file|
          board[Board::AlgebraicCoordinates.new("#{file}2")] = ChessPiece.new_white(PAWN)
        end

        # black base rank
        board[Board::AlgebraicCoordinates.new("a8")] = ChessPiece.new_black(ROOK)

        board[Board::AlgebraicCoordinates.new("b8")] = ChessPiece.new_black(KNIGHT)
        board[Board::AlgebraicCoordinates.new("c8")] = ChessPiece.new_black(BISHOP)
        board[Board::AlgebraicCoordinates.new("d8")] = ChessPiece.new_black(QUEEN)
        board[Board::AlgebraicCoordinates.new("e8")] = ChessPiece.new_black(KING)
        board[Board::AlgebraicCoordinates.new("f8")] = ChessPiece.new_black(BISHOP)
        board[Board::AlgebraicCoordinates.new("g8")] = ChessPiece.new_black(KNIGHT)
        board[Board::AlgebraicCoordinates.new("h8")] = ChessPiece.new_black(ROOK)

        # black pawn rank
        ('a'..'h').each do |file|
          board[Board::AlgebraicCoordinates.new("#{file}7")] = ChessPiece.new_black(PAWN)
        end
      end
    end
  end
end

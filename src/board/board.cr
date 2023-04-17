require "./piece"
require "./constants"
require "../move_check/knight"
require "../move_check/bishop"
require "../move_check/rook_move_checker"
require "../move_check/queen_move_checker"
require "../algebraic_coordinates"

module Board
  class ChessBoard
    def initialize
      @ranks = Array(Array(ChessPiece?)).new(8) do
        Array(ChessPiece?).new(8, nil)
      end

      @move_checkers = {
        KNIGHT => KnightMoveChecker.new(self),
        BISHOP => BishopMoveChecker.new(self),
        ROOK   => RookMoveChecker.new(self),
        QUEEN  => QueenMoveChecker.new(self),
      }
    end

    def ranks
      @ranks
    end

    def []=(algebraic_coordinates : AlgebraicCoordinates, piece : ChessPiece?)
      board_coordinates = algebraic_coordinates.to_board_coordinates
      @ranks[board_coordinates.rank_index][board_coordinates.file_index] = piece
    end

    def [](algebraic_coordinates : AlgebraicCoordinates)
      board_coordinates = algebraic_coordinates.to_board_coordinates
      @ranks[board_coordinates.rank_index][board_coordinates.file_index]
    end

    def to_s(io : IO)
      io << ranks.reverse.join("\n") do |rank|
        rank.join { |e| e || ' ' }
      end
    end

    def move_possible?(from_coordinates : String, to_coordinates : String)
      from_algebraic_coordinates = AlgebraicCoordinates.new(from_coordinates)
      to_algebraic_coordinates = AlgebraicCoordinates.new(to_coordinates)
      move_possible?(from_algebraic_coordinates, to_algebraic_coordinates)
    end

    def move_possible?(from : AlgebraicCoordinates, to : AlgebraicCoordinates)
      from_board_coordinates = from.to_board_coordinates
      return false unless from_board_coordinates.valid?
      to_board_coordinates = to.to_board_coordinates
      return false unless to_board_coordinates.valid?

      piece = self[from]
      return false if piece.nil?

      # 3.1 It is not permitted to move a piece to a square occupied by a piece of the same colour.
      target_piece = self[to]
      return false if piece.colour == target_piece.try &.colour

      move_checker = @move_checkers.not_nil![piece.piece]
      raise "No move checker for piece: #{piece}" if move_checker.nil?

      move_checker.possible?(from_board_coordinates, to_board_coordinates)
    end

    def piece_at_index?(file_index, rank_index)
      !@ranks[rank_index][file_index].nil?
    end
  end
end

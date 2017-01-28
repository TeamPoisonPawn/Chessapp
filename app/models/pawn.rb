class Pawn < Piece
# Pawns can only move forward one square at a time, except for their very first move
# where they can move forward two squares. Pawns can only capture one square diagonally
# in front of them.

# **Promotion** need to define special case for Pawns
# Pawns have another special ability and that is that if a pawn reaches the other side of the board
# it can become any other chess piece (called promotion). A pawn may be promoted to any piece.

  def initialize(args)
    super
    if args[:color] == 1
      write_attribute(:piece_type, "white-pawn.png")
    else
      write_attribute(:piece_type, "black-pawn.png")
    end
  end

end

class Pawn < Piece
# Pawns can only move forward one square at a time, except for their very first move
# where they can move forward two squares. Pawns can only capture one square diagonally
# in front of them.

# **Promotion** need to define special case for Pawns
# Pawns have another special ability and that is that if a pawn reaches the other side of the board
# it can become any other chess piece (called promotion). A pawn may be promoted to any piece.

  def legal_move?(x_dest, y_dest)
    x_diff = (x_dest - self.x_pos).abs
    y_diff = y_dest - self.y_pos

    # Can't move backwards
    return false if y_diff < 1
    # Can't move more than 2 spaces forward and 1 space left or right
    return false if y_diff > 2 || x_diff > 1

    dest_piece ||= self.game.pieces.find_by(x_pos: x_dest, y_pos: y_dest, active: true)

    # Can move 2 or 1 spaces forward on first move.
    if !self.has_moved
      return true if (y_diff == 2 || y_diff == 1) && x_diff == 0
    # Can move only 1 space forward after first move
    else
      return true if y_diff == 1 && x_diff == 0
    end

    # Can move one space diagonally as long as a piece of the opposite color is on the destination spot
    if dest_piece
      return true if (((y_diff == x_diff) && x_diff == 1) && dest_piece.color != self.color)
    end

    # All other moves are invalid
    return false
  end

end

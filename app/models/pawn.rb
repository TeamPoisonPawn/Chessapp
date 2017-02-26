class Pawn < Piece
# Pawns can only move forward one square at a time, except for their very first move
# where they can move forward two squares. Pawns can only capture one square diagonally
# in front of them.

# **Promotion** need to define special case for Pawns
# Pawns have another special ability and that is that if a pawn reaches the other side of the board
# it can become any other chess piece (called promotion). A pawn may be promoted to any piece.

  def valid_move?(x_dest, y_dest)
    super && legal_move?(x_dest, y_dest)
  end

  def legal_move?(x_dest, y_dest)
    x_diff = (x_dest - self.x_pos).abs
    if color == "white"
      y_diff = y_dest - self.y_pos
    else
      y_diff = (y_dest - self.y_pos).abs
      backwards_check = y_dest - self.y_pos
    end

    # Can't move backwards
    return false if color == "white" && y_diff < 1
    return false if color == "black" && backwards_check > 0
    
    # Can't move more than 2 spaces forward and 1 space left or right
    return false if y_diff > 2 || x_diff > 1

    dest_piece = piece_at_location(x_dest, y_dest)

    if x_diff == y_diff
      # Can move one space diagonally as long as a piece of the opposite color is on the destination spot
      if dest_piece
        return false if dest_piece.color == self.color
        return true if (((y_diff == x_diff) && x_diff == 1) && dest_piece.color != self.color)
      end
    else
      # Can move 2 or 1 spaces forward on first move.
      if !self.has_moved
        self.update_attributes(has_moved: true)
        return true if (y_diff == 2 || y_diff == 1) && x_diff == 0 && dest_piece == nil
      # Can move only 1 space forward after first move
      else
        self.update_attributes(has_moved: true)
        return true if y_diff == 1 && x_diff == 0 && dest_piece == nil
      end
      return false
    end

    # All other moves are invalid
    return false
  end

end

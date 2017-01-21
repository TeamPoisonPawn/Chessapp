class King < Piece
  # The king is the most important piece, but is one of the weakest.
  # The king can only move one square in any direction - up, down, to the sides, and diagonally.
  # ** Special case **
  # The king may never move himself into check (where he could be captured).
  def valid_move?(x_destination, y_destination)
    super && legal_move?(x_destination, y_destination)
  end

  #king movement is only at 1 so when x_destination must be -1 from the location of the king(params)
  def legal_move?(x_destination, y_destination)
    x_movement_difference = (x_destination - self.x_pos).abs
    y_movement_difference = (y_destination - self.y_pos).abs

    x_movement_difference.between?(0, 1) && y_movement_difference.between?(0, 1)
  end
end
